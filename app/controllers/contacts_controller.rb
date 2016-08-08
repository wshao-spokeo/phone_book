class ContactsController < ApplicationController

	def index
		@all_contacts = Contact.all()
	end

	def new
	end

	def create

		@contact = Contact.new(conv_hashkey_str2symbol(params[:contact]))
		#@contact = Contact.new(params[:contact])
		@contact.save

		post_params = params[:post]

		phone_number_hash = {
			'contact_id': @contact.id,
			'content': post_params['phone_number_1'],
			'kind_id': post_params['phone_number_kind_1'].to_i,
			'priority': 1
		}

		email_address_hash = {
			'contact_id': @contact.id,
			'content': post_params['email_address_1'],
			'priority': 1
		}

		street_address_hash = {
			'contact_id': @contact.id,
			'content': post_params['street_address_1'],
			'priority': 1
		}

		phone_number = PhoneNumber.new(phone_number_hash)
		phone_number.save

		email_address = EmailAddress.new(email_address_hash)
		email_address.save

		street_address = StreetAddress.new(street_address_hash)
		street_address.save

		redirect_to @contact

	end

	def show
		@contact = Contact.find(params[:id])
	end

	def edit
		@contact = Contact.find(params[:id])
		
	end

	def update
		if @contact.update_attributes(contact_params)
			flash[:success] = "Profile updated"
      redirect_to @contact
      # Handle a successful update.
    else
      render 'edit'
    end

	end

	def destroy
		@contact = Contact.find(params[:id])
		@contact.phone_numbers.destroy_all()
		@contact.email_addresses.destroy_all()
		@contact.street_addresses.destroy_all()
		@contact.destroy
		redirect_to @contact
	end

	private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name)
  end

  def conv_hashkey_str2symbol(map1)
  	map2 = Hash.new
  	map1.each do |k, v|
  		map2[k.to_sym] = v
  	end
  	return map2
  end

end

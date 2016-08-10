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

		#post_params = params[:post]

		pnkprefix = "phone_number_kind_"
		eaprefix = "email_address_"
		saprefix = "street_address_"

		# Update phone_number and phone_number_kind
		params.each do |k, v|

			if k.starts_with?(pnkprefix)
			
				pri = k[pnkprefix.length]
				pnstr = "phone_number_" + pri
				pnhash = {
					'contact_id': @contact.id,
					'content': params[pnstr],
					'kind_id': v.to_i,
					'priority': pri.to_i
				}
				pno = PhoneNumber.new(pnhash)
				pno.save
			
			elsif k.starts_with?(eaprefix)
			
				pri = k[eaprefix.length]
				eahash = {
					'contact_id': @contact.id,
					'content': v,
					'priority': pri.to_i
				}
				eao = EmailAddress.new(eahash)
				eao.save
			
			elsif k.starts_with?(saprefix)
			
				pri = k[saprefix.length]
				sahash = {
					'contact_id': @contact.id,
					'content': v,
					'priority': pri.to_i
				}
				sao = StreetAddress.new(sahash)
				sao.save
			
			end
		
		end

		redirect_to @contact

	end

	def show

		@contact = Contact.find(params[:id])
		@pnkhash = Hash.new
		@pnkrevhash = Hash.new
		PhoneNumberKind.find_each do |pnk|
			@pnkhash[pnk.id] = pnk.kind
			@pnkrevhash[pnk.kind] = pnk.id
		end

		#render plain: @pnkhash.inspect

	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def update

		@contact = Contact.find(params[:id])

		#render plain: contact_params.inspect
		#render plain: params.inspect

#=begin

		#@contact.update_all(contact_params)
		@contact.first_name = contact_params['first_name']
		@contact.last_name = contact_params['last_name']
		@contact.save

		pnkprefix = "phone_number_kind_"
		eaprefix = "email_address_"
		saprefix = "street_address_"

		# Count how many items there are for each, originally, before the dynamic item adding
		pnoc = @contact.phone_numbers.count
		eaoc = @contact.email_addresses.count
		saoc = @contact.street_addresses.count

		# Update phone_number and phone_number_kind
		params.each do |k, v|

			if k.starts_with?(pnkprefix)
				pristr = k[pnkprefix.length]
				pri = pristr.to_i
				if pri > pnoc
					# Create new record for phone number
					pnstr = "phone_number_" + pristr
					pnhash = {
						'contact_id': @contact.id,
						'content': params[pnstr],
						'kind_id': v.to_i,
						'priority': pri
					}
					pno = PhoneNumber.new(pnhash)
					pno.save
				else
					pnstr = "phone_number_" + pristr
					pnhash = Hash.new
					pnhash[:content] = params[pnstr]
					pnhash[:kind_id] = v.to_i
					#render plain: pnhash.inspect
					pno = @contact.phone_numbers.find(priority=pri)
					pno.attributes = pnhash
					pno.save
				end

			elsif k.starts_with?(eaprefix)
				
				pristr = k[eaprefix.length]
				pri = pristr.to_i
				if pri > eaoc
					eastr = "email_address_" + pristr
					eahash = {
						'contact_id': @contact.id,
						'content': v,
						'priority': pri
					}
					eao = EmailAddress.new(eahash)
					eao.save
				else
					eao = @contact.email_addresses.find(priority=pri)
					eao.attributes = {'content': v}
					eao.save
				end

			elsif k.starts_with?(saprefix)

				pristr = k[saprefix.length]
				pri = pristr.to_i
				if pri > saoc
					sastr = "street_address_" + pristr
					sahash = {
						'contact_id': @contact.id,
						'content': v,
						'priority': pri
					}
					sao = StreetAddress.new(sahash)
					sao.save
				else
					sao = @contact.street_addresses.find(priority=pri)
					sao.attributes = {'content': v}
					sao.save
				end

			end

		end

		redirect_to @contact

#=end

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

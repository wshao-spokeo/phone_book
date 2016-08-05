class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.save
		redirect_to @contact
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def edit

	end

	def update

	end

	def destroy

	end

	private
  def article_params
    params.require(:contact).permit(:first_name, :last_name)
  end

end

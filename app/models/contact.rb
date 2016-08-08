class Contact < ActiveRecord::Base

	has_many :phone_numbers
	has_many :email_addresses
	has_many :street_addresses

	def full_name
		"#{first_name} #{last_name}"
	end

end

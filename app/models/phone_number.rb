class PhoneNumber < ActiveRecord::Base

	enum kind_id: ["Mobile", "Home", "Work"]
	belongs_to :contact

end

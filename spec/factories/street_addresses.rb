require 'faker'

FactoryGirl.define do
	factory :street_address do |f|
		f.content { Faker::Address.street_address + " " + Faker::Address.city + " " + Faker::Address.state_abbr }
		f.priority { 1 }
	end
end

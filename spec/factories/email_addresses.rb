require 'faker'

FactoryGirl.define do
	factory :email_address do |f|
		f.content { Faker::Internet.email }
		f.priority { 1 }
	end
end

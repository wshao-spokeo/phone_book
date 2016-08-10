require 'faker'

FactoryGirl.define do
  factory :phone_number do |f|
  	f.content { Faker::PhoneNumber.phone_number }
  	f.kind_id { rand(1..3) }
  	f.priority { 1 }
  end
end

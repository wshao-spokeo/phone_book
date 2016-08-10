require 'rails_helper'

RSpec.describe Contact, type: :model do

  # pending "add some examples to (or delete) #{__FILE__}"

  it "has a valid factory" do
    #FactoryGirl.create(:contact).should be_valid
    expect(FactoryGirl.create(:contact)).to be_valid
  end

=begin
	it "is invalid without a first name" do
		#FactoryGirl.build(:contact, first_name: nil).should_not be_valid
  	expect(FactoryGirl.build(:contact, first_name: nil)).to be_nil
	end
  
  it "is invalid without a last name" do
    #FactoryGirl.build(:contact, last_name: nil).should_not be_valid
    expect(FactoryGirl.build(:contact, last_name: nil)).to be_nil
  end
=end

 	it "returns a contact's full name as a string" do
  	contact = FactoryGirl.build(:contact, first_name: "Jalen", last_name: "Rose")
  	#contact.full_name.should == "John Doe"
  	expect(contact.full_name).to eq("Jalen Rose")
	end

end

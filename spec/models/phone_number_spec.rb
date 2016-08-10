require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:phone_number)).to be_valid
  end

end

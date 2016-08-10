require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe EmailAddress, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:email_address)).to be_valid
  end

end

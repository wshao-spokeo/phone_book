require 'rails_helper'

RSpec.describe StreetAddress, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:street_address)).to be_valid
  end

end

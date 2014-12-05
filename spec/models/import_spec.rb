require 'rails_helper'

RSpec.describe Import, :type => :model do
  let(:import)  { FactoryGirl.create(:import) }

  it "has valid zipcode" do
    expect(import).to be_valid
  end

  it "invalid without zipcode" do
    import.zipcode = nil
    expect(import).to_not be_valid
  end
end

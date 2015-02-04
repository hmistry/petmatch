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

  it "invalid with zip outside 0-99999" do
    ["abc", -1, 100000].each do |zip|
      import.zipcode = zip
      expect(import).to_not be_valid
    end
  end

  it "valid with zip range 0-99999" do
    [0, 34923, 99999].each do |zip|
      import.zipcode = zip
      expect(import).to be_valid
    end
  end
end

require 'rails_helper'

RSpec.describe Option, :type => :model do
  let(:option)  { FactoryGirl.create(:option) }

  it 'valid name' do
    expect(option).to be_valid
  end

  it 'invalid without name' do
    option.name = nil
    expect(option).to_not be_valid
  end

  it "associated with pets" do
    expect(option).to respond_to(:pets)
  end
end

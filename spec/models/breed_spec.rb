require 'rails_helper'

RSpec.describe Breed, :type => :model do
  let(:breed) { FactoryGirl.create(:breed) }

  it "valid with type + animal" do
    expect(breed).to be_valid
  end

  it "invalid without type" do
    breed.type = nil
    expect(breed).to_not be_valid
  end

  it "associated with pets" do
    expect(breed).to respond_to(:pets)
  end

  it "associated with animal" do
    expect(breed).to respond_to(:animal)
  end

  it "invalid without animal" do
    breed.animal = nil
    expect(breed).to_not be_valid
  end
end

require 'rails_helper'

RSpec.describe Shelter, :type => :model do
  let(:shelter)  { FactoryGirl.create(:shelter) }

  it 'valid name, city, state, zip, country, id_pf' do
    expect(shelter).to be_valid
  end

  it 'valid without phone, email, address1, address2' do
    shelter.phone = nil
    shelter.email = nil
    shelter.address1 = nil
    shelter.address2 = nil

    expect(shelter).to be_valid
  end

  it 'invalid without name' do
    shelter.name = nil
    expect(shelter).to_not be_valid
  end

  it 'invalid without city' do
    shelter.city = nil
    expect(shelter).to_not be_valid
  end

  it 'invalid without state' do
    shelter.state = nil
    expect(shelter).to_not be_valid
  end

  it 'invalid without zip' do
    shelter.zip = nil
    expect(shelter).to_not be_valid
  end

  it 'invalid without country' do
    shelter.country = nil
    expect(shelter).to_not be_valid
  end

  it 'invalid without id_pf' do
    shelter.id_pf = nil
    expect(shelter).to_not be_valid
  end

  it 'address = address1, address2' do
    expect(shelter.address).to eq("#{shelter.address1}, #{shelter.address2}")
  end

  it 'address = address1 when address2 is empty' do
    shelter.address2 = ""
    expect(shelter.address).to eq("#{shelter.address1}")
  end

  it 'orders by state, city, and name by default' do
    shelter_one = FactoryGirl.create(:shelter, state: "AA", city: "Boredland", name: "Acme Pets")
    shelter_two = FactoryGirl.create(:shelter, state: "AA", city: "Boredland", name: "Zap Inc")
    shelter_three = FactoryGirl.create(:shelter, state: "AA", city: "Sunnyland", name: "Acme Pets")
    shelter_four = FactoryGirl.create(:shelter, state: "AA", city: "sunnyland", name: "Zap Inc")
    shelter_five = FactoryGirl.create(:shelter, state: "HZ", city: "Boredland", name: "Acme Pets")
    shelter_six = FactoryGirl.create(:shelter, state: "HZ", city: "Boredland", name: "Zap Inc")
    shelter_seven = FactoryGirl.create(:shelter, state: "HZ", city: "Sunnyland", name: "Acme Pets")
    shelter_eight = FactoryGirl.create(:shelter, state: "HZ", city: "sunnyland", name: "Zap Inc")

    expect(Shelter.all).to eq([shelter_one, shelter_two, shelter_three, shelter_four, shelter_five, shelter_six, shelter_seven, shelter_eight])
  end
end

require 'rails_helper'

RSpec.describe Shelter, :type => :model do
  let(:shelter)  { FactoryGirl.create(:shelter) }

  it 'valid name' do
    expect(shelter).to be_valid
  end

  it 'invalid without name' do
    shelter.name = nil
    expect(shelter).to_not be_valid
  end

  it 'valid city' do
    expect(shelter).to be_valid
  end

  it 'invalid without city' do
    shelter.city = nil
    expect(shelter).to_not be_valid
  end

  it 'valid state' do
    expect(shelter).to be_valid
  end

  it 'invalid without state' do
    shelter.state = nil
    expect(shelter).to_not be_valid
  end

  it 'valid zip' do
    expect(shelter).to be_valid
  end

  it 'invalid without zip' do
    shelter.zip = nil
    expect(shelter).to_not be_valid
  end

  it 'valid country' do
    expect(shelter).to be_valid
  end

  it 'invalid without country' do
    shelter.country = nil
    expect(shelter).to_not be_valid
  end

  it 'valid id_pf' do
    expect(shelter).to be_valid
  end

  it 'invalid without id_pf' do
    shelter.id_pf = nil
    expect(shelter).to_not be_valid
  end


end

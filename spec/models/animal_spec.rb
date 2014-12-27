require 'rails_helper'

RSpec.describe Animal, :type => :model do

  it 'has Barnyard' do
    expect(Animal::BARNYARD.type).to eq("Barnyard")
  end

  it 'has Bird' do
    expect(Animal::BIRD.type).to eq("Bird")
  end

  it 'has Cat' do
    expect(Animal::CAT.type).to eq("Cat")
  end

  it 'has Dog' do
    expect(Animal::DOG.type).to eq("Dog")
  end

  it 'has Cat' do
    expect(Animal::CAT.type).to eq("Cat")
  end
end

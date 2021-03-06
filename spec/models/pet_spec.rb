require 'rails_helper'

RSpec.describe Pet, :type => :model do
  let(:pet) { FactoryGirl.create(:pet) }

  describe :validity do
    it 'valid with shelter, name' do
      expect(pet).to be_valid
    end

    it 'invalid without shelter' do
      pet.shelter = nil
      expect(pet).to_not be_valid
    end

    it 'invalid without name' do
      pet.name = nil
      expect(pet).to_not be_valid
    end

    it 'valid if mix is yes/no' do
      pet.mix = "yes"
      expect(pet).to be_valid

      pet.mix = "no"
      expect(pet).to be_valid
    end

    it 'invalid if mix is not yes/no' do
      pet.mix = "y"
      expect(pet).to_not be_valid

      pet.mix = "maybe"
      expect(pet).to_not be_valid
    end

    it 'valid if gender is m/f/u' do
      pet.sex = "M"
      expect(pet).to be_valid

      pet.sex = "F"
      expect(pet).to be_valid

      pet.sex = "U"
      expect(pet).to be_valid
    end

    it 'invalid if gender is not m/f/u' do
      pet.sex = "A"
      expect(pet).to_not be_valid

      pet.sex = "O"
      expect(pet).to_not be_valid

      pet.sex = "N"
      expect(pet).to_not be_valid
    end

    it 'valid if size is s/m/l/xl' do
      pet.size = "S"
      expect(pet).to be_valid

      pet.size = "M"
      expect(pet).to be_valid

      pet.size = "L"
      expect(pet).to be_valid

      pet.size = "XL"
      expect(pet).to be_valid
    end

    it 'invalid if size is not s/m/l/xl' do
      pet.size = "XS"
      expect(pet).to_not be_valid

      pet.size = "medium"
      expect(pet).to_not be_valid

      pet.size = "big"
      expect(pet).to_not be_valid

      pet.size = "A"
      expect(pet).to_not be_valid
    end

    it 'valid if status is a/h/p/x' do
      pet.status = "A"
      expect(pet).to be_valid

      pet.status = "H"
      expect(pet).to be_valid

      pet.status = "P"
      expect(pet).to be_valid

      pet.status = "X"
      expect(pet).to be_valid
    end

    it 'invalid if status is not a/h/p/x' do
      pet.status = "B"
      expect(pet).to_not be_valid

      pet.status = "h"
      expect(pet).to_not be_valid

      pet.status = "available"
      expect(pet).to_not be_valid

      pet.status = "sold"
      expect(pet).to_not be_valid
    end

    it 'valid if age is baby/young/adult/senior' do
      pet.age = "Baby"
      expect(pet).to be_valid

      pet.age = "Young"
      expect(pet).to be_valid

      pet.age = "Adult"
      expect(pet).to be_valid

      pet.age = "Senior"
      expect(pet).to be_valid
    end

    it 'invalid if age is not baby/young/adult/senior' do
      pet.age = "baby"
      expect(pet).to_not be_valid

      pet.age = "Old"
      expect(pet).to_not be_valid

      pet.age = "Kid"
      expect(pet).to_not be_valid

      pet.age = "Kitten"
      expect(pet).to_not be_valid
    end
  end

  describe :association do
    it 'associated with shelter' do
      expect(pet).to respond_to(:shelter)
    end

    it 'associated with animal' do
      expect(pet).to respond_to(:animal)
    end

    it 'associated with options' do
      expect(pet).to respond_to(:options)
    end

    it 'associated with breeds' do
      expect(pet).to respond_to(:breeds)
    end
  end

  describe :methods do
    it 'sex_description returns gender desc' do
      pet.sex = 'M'
      expect(pet.sex_description).to eq('Male')

      pet.sex = 'F'
      expect(pet.sex_description).to eq('Female')

      pet.sex = 'U'
      expect(pet.sex_description).to eq('Unknown')
    end

    it 'mix_description returns full desc' do
      pet.mix = 'yes'
      expect(pet.mix_description).to eq('Mix')

      pet.mix = 'no'
      expect(pet.mix_description).to eq('Pure')
    end

    it 'status_description returns status desc' do
      pet.status = 'A'
      expect(pet.status_description).to eq('Adoptable')

      pet.status = 'H'
      expect(pet.status_description).to eq('On Hold')

      pet.status = 'P'
      expect(pet.status_description).to eq('Pending')

      pet.status = 'X'
      expect(pet.status_description).to eq('Adopted')
    end

    it 'size_description returns size desc' do
      pet.size = 'S'
      expect(pet.size_description).to eq('Small')

      pet.size = 'M'
      expect(pet.size_description).to eq('Medium')

      pet.size = 'L'
      expect(pet.size_description).to eq('Large')

      pet.size = 'XL'
      expect(pet.size_description).to eq('Extra Large')
    end

  end
end

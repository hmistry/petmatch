require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe 'Pet Show', type: :feature do
  let!(:acme_shelter) { FactoryGirl.create(:shelter) }
  let!(:good_dog) { FactoryGirl.create(:pet, shelter: acme_shelter) }

  before :each do
    visit pet_path(good_dog)
  end

  context "Interaction" do
    it 'can navigate to pets' do
      page.click_link('Back')
      expect(current_path).to eq(pets_path)
    end

    it 'can navigate to shelter' do
      page.click_link(acme_shelter.name)
      expect(current_path).to eq(shelter_path(acme_shelter))
    end
  end

  context "View" do
    it 'has image' do
      pet = page.first('.panel')
      expect(pet.find('.panel-body')).to have_selector('img')
    end

    it 'has 5 attributes listed' do
      pet = page.find('.panel-body')
      attributes_list = pet.find('.list-inline')

      expect(attributes_list).to have_selector('li', count: 5)
      expect(attributes_list).to have_text(good_dog.animal.type)
      expect(attributes_list).to have_text(good_dog.age)
      expect(attributes_list).to have_text(good_dog.sex_description)
      expect(attributes_list).to have_text(good_dog.size_description)
      expect(attributes_list).to have_text(good_dog.mix_description)
    end

    it 'has label for status' do
      pet = page.first('.panel-body')
      label = pet.find('.label')

      expect(label).to have_text(good_dog.status_description)
    end

    it 'only shelter is a link' do
      links = page.find('.panel').all('a')

      expect(links.count).to eq(1)
      expect(links[0]).to have_text(acme_shelter.name.titleize)
    end

    it 'has pet ID' do
      expect(page).to have_text('ID:')
      expect(page).to have_text(good_dog.shelter_pet_id_pf)
    end

    it 'has options' do
      expect(page).to have_text('Options:')
      expect(page).to have_text(good_dog.options.map { |e| e.name }.join(", "))
    end

    it 'has breed' do
      expect(page).to have_text('Breed:')
      expect(page).to have_text(good_dog.breeds.map { |e| e.type }.join(", "))
    end

    it 'has description' do
      expect(page).to have_text('Description:')
      expect(page).to have_text(good_dog.description)
    end
  end
end

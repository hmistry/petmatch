require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe 'Pets Index', type: :feature do
  let!(:acme_shelter) { FactoryGirl.create(:shelter) }
  let!(:good_dog) { FactoryGirl.create(:pet, shelter: acme_shelter) }

  before :each do
    visit pets_path
  end

  context "Interaction" do
    it 'can navigate to pet' do
      page.click_link(good_dog.name)
      expect(current_path).to eq(pet_path(good_dog))
    end

    it 'can navigate to shelter' do
      page.click_link(acme_shelter.name)
      expect(current_path).to eq(shelter_path(acme_shelter))
    end
  end

  context "View" do
    it 'has N pets' do
      5.times { |n| FactoryGirl.create(:pet, name: "Bad Doggy #{n}") }
      visit pets_path
      pets = page.all('.panel')

      expect(pets.count).to eq(6)
    end

    it 'has image' do
      pet = page.first('.panel')
      expect(pet.find('.panel-heading')).to have_selector('img')
    end

    it 'has 4 attributes listed' do
      pet = page.first('.panel')
      attributes_list = pet.find('.list-inline.text-muted')

      expect(attributes_list).to have_selector('li', count: 4)
      expect(attributes_list).to have_text(good_dog.age)
      expect(attributes_list).to have_text(good_dog.sex_description)
      expect(attributes_list).to have_text(good_dog.size_description)
      expect(attributes_list).to have_text(good_dog.mix_description)
    end

    it 'has label for status' do
      pet = page.first('.panel')
      label = pet.find('.label')

      expect(label).to have_text(good_dog.status_description)
    end

    it 'only name and shelter is a link' do
      pets = page.all('.panel')
      links = pets.first.all('a')

      expect(links.count).to eq(2)
      expect(links[0]).to have_text(good_dog.name.titleize)
      expect(links[1]).to have_text(acme_shelter.name.titleize)
    end

    it 'has All, Cats and Dogs link' do
      pets = page.all('h4')
      links = pets.first.all('a')

      expect(links.count).to eq(3)
      expect(links[0]).to have_text("All")
      expect(links[1]).to have_text("Cats")
      expect(links[2]).to have_text("Dogs")
    end

    it 'links All, Cats and Dogs have 0, 1, 1 params respectively' do
      pets = page.all('h4')
      links = pets.first.all('a')

      expect(links[0][:href].include?("")).to eq(true)
      expect(links[1][:href].include?("cat")).to eq(true)
      expect(links[2][:href].include?("dog")).to eq(true)
    end
  end
end

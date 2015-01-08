require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe 'Shelter Show', type: :feature do
  let!(:acme_shelter) { FactoryGirl.create(:shelter) }

  before :each do
    visit shelter_path(acme_shelter)
  end

  context "Interaction" do
    it 'can navigate to shelters' do
      page.click_link("Back")
      expect(current_path).to eq(shelters_path)
    end
  end

  context "View" do
    it 'has name' do
      expect(page).to have_text(acme_shelter.name.titleize)
    end

    it 'has address' do
      expect(page).to have_text('Address:')
      expect(page).to have_text(acme_shelter.address)
      expect(page).to have_text("#{acme_shelter.city}, #{acme_shelter.state} #{acme_shelter.zip}")
    end

    it 'has phone' do
      expect(page).to have_text('Phone:')
      expect(page).to have_text(acme_shelter.phone)
    end

    it 'has email' do
      expect(page).to have_text('Email:')
      expect(page).to have_text(acme_shelter.email.downcase)
    end
  end
end

require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe 'Shelters', type: :feature do
  let!(:acme_shelter) { FactoryGirl.create(:shelter) }
  5.times { |n| FactoryGirl.create(:shelter, name: "Bunny Pets #{n}") }

  before :each do
    visit shelters_path
  end

  context 'from Nav bar' do
    it 'can navigate to pets' do
      page.click_link("Pets")
      expect(current_path).to eq(pets_path)
    end

    it 'can navigate to import' do
      page.click_link("Import")
      expect(current_path).to eq(imports_path)
    end
  end

  context "main listing" do
    it 'can navigate to shelter' do
      pending
      page.click_link("Acme Pets")
      expect(current_path).to eq(shelters_path(acme_shelter))
    end
  end
end

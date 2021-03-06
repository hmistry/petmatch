require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe 'Nav Bar', type: :feature do

  before :each do
    visit root_path
  end

  context 'from Root' do
    it 'can navigate to pets' do
      page.click_link("PETS")
      expect(current_path).to eq(pets_path)
    end

    it 'can navigate to shelter' do
      page.click_link("SHELTERS")
      expect(current_path).to eq(shelters_path)
    end

    it 'can navigate to import' do
      page.click_link("IMPORT")
      expect(current_path).to eq(imports_path)
    end
  end
end

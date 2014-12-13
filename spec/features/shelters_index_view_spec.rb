require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe 'Shelters', type: :feature do
  5.times { |n| FactoryGirl.create(:shelter, name: "Bunny Pets #{n}") }
  let!(:shelter) { FactoryGirl.create(:shelter) }

  before :each do
    visit shelters_path
  end

  context "View" do
    it 'has table headers: name, phone, email, address, city, state, zip' do
      header = page.find('//table').first('tr')
      expect(header).to have_selector('th', count: 7)
      expect(header).to have_text("Name")
      expect(header).to have_text("Phone")
      expect(header).to have_text("Email")
      expect(header).to have_text("Address")
      expect(header).to have_text("City")
      expect(header).to have_text("State")
      expect(header).to have_text("Zip")
    end

    it 'has N shelter items + header row' do
      table = page.find('//table')
      expect(table).to have_selector('tr', count: 7)
    end

    it 'displays shelters by city & state, then by name in ascending order'
  end
end

require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe 'Shelters', type: :feature do
  let!(:shelter) { FactoryGirl.create(:shelter); puts 'shelter' }

  before :each do
    visit shelters_path
  end

  context "View" do
    it 'has table headers: name, phone/email, address, city, state, zip' do
      header = page.find('//table').first('tr')

      expect(header).to have_selector('th', count: 6)
      expect(header).to have_text("Name")
      expect(header).to have_text("Phone/Email")
      expect(header).to have_text("Address")
      expect(header).to have_text("City")
      expect(header).to have_text("State")
      expect(header).to have_text("Zip")
    end

    it 'has N shelter items + header row' do
      5.times { |n| FactoryGirl.create(:shelter, name: "Bunny Pets #{n}") }
      visit shelters_path
      table = page.find('//table')
      expect(table).to have_selector('tr', count: 7)
    end
  end
end

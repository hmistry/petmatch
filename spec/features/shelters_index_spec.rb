require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe 'Shelters Index', type: :feature do
  let!(:acme_shelter) { FactoryGirl.create(:shelter) }
  5.times { |n| FactoryGirl.create(:shelter, name: "Bunny Pets #{n}") }

  before :each do
    visit shelters_path
  end

  context "Interaction" do
    it 'can navigate to shelter' do
      page.click_link("Acme Pets")
      expect(current_path).to eq(shelter_path(acme_shelter))
    end
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

    it 'only name is a link' do
      rows = page.find('//table').all('tr')
      links = rows[1].all('a')

      expect(links.count).to eq(1)
      expect(links.first).to have_text(acme_shelter.name.titleize)
    end
  end
end

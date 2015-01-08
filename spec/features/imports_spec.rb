require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe 'Imports', type: :feature do
  let!(:import) { FactoryGirl.create(:import) }
  let!(:shelter) { FactoryGirl.create(:shelter) }
  let!(:dog) { FactoryGirl.create(:pet, shelter: shelter) }

  before :each do
    visit imports_path
  end

  context "Interaction" do
    it 'zipcode with no shelters' do
      allow_any_instance_of(ShelterImporter).to receive(:import).with("12345").and_return([])
      allow_any_instance_of(ShelterImporter).to receive(:nearby_zipcodes).and_return(["123", "234"])

      page.fill_in("Zipcode", with: "12345")
      page.click_button("Import Pets")

      expect(page.find('.alert')).to have_text("123, 234")
      expect(current_path).to eq(imports_path)
    end

    it 'zipcode with shelters' do
      allow_any_instance_of(ShelterImporter).to receive(:import).with("12345").and_return([shelter])
      allow_any_instance_of(PetImporter).to receive(:import).with([shelter])
      allow_any_instance_of(PetImporter).to receive(:imported_count).and_return(1)

      page.fill_in("Zipcode", with: "12345")
      page.click_button("Import Pets")

      expect(page.find('.alert')).to have_text("1 pets in 1 shelters")
      expect(current_path).to eq(imports_path)
    end
  end

  context "View" do
    it 'has import pets button' do
      expect(page).to have_selector('button', count: 1)
    end

    it 'has zipcode input field' do
      import_div = page.find('.import_zipcode')

      expect(import_div).to have_selector('label', count: 1)
      expect(import_div).to have_selector('input', count: 1)

      expect(import_div.find('label')).to have_text('Zipcode')
      expect(import_div).to have_selector('input#import_zipcode')
    end
  end
end

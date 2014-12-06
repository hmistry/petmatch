require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe 'Imports', type: :feature do
  let!(:import) { FactoryGirl.create(:import) }

  before :each do
    visit imports_path
  end

  context "form" do
    it 'zipcode with no shelters' do
      pending
      allow_any_instance_of(Petfinder::Client).to receive(:find_shelters).with("12345").and_return([{"id_pf" => "2", "zip" => "12333"}])
      page.fill_in("Zipcode", with: "12345")
      page.click_button("Create Import")
      expect()
    end

    it 'zipcode with shelters' do
      pending
      page.fill_in("Zipcode", with: "12345")
      page.click_button("Create Import")
      expect()
    end
  end
end

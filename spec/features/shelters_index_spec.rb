require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe 'Shelters', type: :feature do
  let!(:acme_shelter) { FactoryGirl.create(:shelter) }
  5.times { |n| FactoryGirl.create(:shelter, name: "Bunny Pets #{n}") }

  before :each do
    visit shelters_path
  end

  context "main listing" do
    it 'can navigate to shelter' do
      page.click_link("Acme Pets")
      expect(current_path).to eq(shelter_path(acme_shelter))
    end
  end
end

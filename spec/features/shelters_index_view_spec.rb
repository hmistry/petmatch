require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe 'Shelters', type: :feature do
  let!(:shelter) { FactoryGirl.create(:shelter) }

  before :each do
    visit shelters_path
  end

  context "View" do
    it 'any content to check in view'
  end
end

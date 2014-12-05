require 'rails_helper'

RSpec.describe "imports/index", :type => :view do
  let!(:import) { FactoryGirl.create(:import) }

  before(:each) do
    assign(:import, import)
  end

  it "renders import form" do
    render
    expect(rendered).to render_template(partial: "_form")
  end
end

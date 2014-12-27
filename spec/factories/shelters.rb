# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shelter do
    # sequence(:id) { |n| n }
    name "Acme Pets"
    phone "345-890-1239"
    email "daffy@acme.com"
    address1 "123 grand ave"
    address2 "Suite 100"
    city "sunnyland"
    state "AA"
    zip "12345"
    country "USA"
    sequence(:id_pf) { |n| n }
  end
end

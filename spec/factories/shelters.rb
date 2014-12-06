# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shelter do
    # sequence(:id) { |n| n }
    sequence(:id_pf) { |n| n }
    name "Acme Pets"
    phone "345-890-1239"
    email "daffy@acme.com"
    city "sunnyland"
    state "AA"
    zip "12345"
  end
end

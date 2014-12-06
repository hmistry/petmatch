# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pet do
    sequence(:id) { |n| n }
    # sequence(:id_pf) { |n| n }
    # name Acme Pets
    # phone "345-890-1239"
  end
end

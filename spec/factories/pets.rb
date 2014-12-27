# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pet do
    # sequence(:id) { |n| n }
    sequence(:id_pf) { |n| n }
    name "Bugs Bunny"
    contact "345-890-1239"
    status "A"
    description "Lorem ipsum"
    sex "M"
    age "Young"
    size "M"
    mix "no"
    shelter_pet_id_pf "X1"

    shelter
    animal
  end
end

FactoryGirl.define do
  factory :valid_group, class: "Group" do
    title   Faker::Lorem.characters(20)
    description Faker::Lorem.sentences(3)
  end
end

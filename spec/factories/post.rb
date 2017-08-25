FactoryGirl.define do
  factory :valid_post, class: 'Post' do
    content Faker::Lorem.sentence(4)
    association :group, factory: :valid_group
    association :user, factory: :clean_user
  end
end

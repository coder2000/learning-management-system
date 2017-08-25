FactoryGirl.define do
  factory :clean_repository, class: 'Repository' do
    title Faker::Book.title
    association :user, factory: :clean_user
  end
end

FactoryGirl.define do
  factory :valid_comment, class: "Comment" do
    content Faker::Lorem.sentence
    association :user, factory: :clean_user
    association :post, factory: :valid_post
  end

  factory :invalid_comment, class: "Comment" do
    content ''
    user    ''
    post    ''
  end
end

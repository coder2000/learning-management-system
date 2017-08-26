FactoryGirl.define do
  factory :clean_user, class: 'User' do
    email { Faker::Internet.email }
    password 'secret'
    password_confirmation 'secret'
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.last_name }
    last_name { Faker::Name.last_name }
    gender 'male'

    factory :student do
      role :student
    end

    factory :instructor do
      role :admin
    end
  end
end

FactoryGirl.define do
  factory :clean_user, class: "User" do
    email                 { Faker::Internet.email }
    password              "secret"
    password_confirmation "secret"
    fname                 { Faker::Name.first_name }
    mname                 { Faker::Name.last_name }
    lname                 { Faker::Name.last_name }
    gender                "male"

    factory :student do
      role                  :student
    end

    factory :instructor do
      role                  :instructor
    end
  end
end

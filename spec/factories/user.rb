FactoryGirl.define do
  factory :clean_user, class: "User" do
    email                 Faker::Internet.email
    password              "secret"
    password_confirmation "secret"
    fname                 Faker::Name.first_name
    mname                 Faker::Name.last_name
    lname                 Faker::Name.last_name
    gender                "male"
    role                  :student
  end

  factory :clean_instructor, class: "User" do
    email                 Faker::Internet.email
    password              "secret"
    password_confirmation "secret"
    fname                 Faker::Name.first_name
    mname                 Faker::Name.last_name
    lname                 Faker::Name.last_name
    gender                "male"
    role                  :instructor
  end
end

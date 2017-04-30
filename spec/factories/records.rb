FactoryGirl.define do
  factory :clean_record, class: "Record" do
    association :repository, factory: :clean_repository
  end
end

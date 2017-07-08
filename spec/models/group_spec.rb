require 'rails_helper'

RSpec.describe Group, type: :model do
  it { is_expected.to be_mongoid_document }

  describe "fields" do
    it { is_expected.to have_field(:title).of_type(String) }
    it { is_expected.to have_field(:description).of_type(String) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe "relations" do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_and_belong_to_many(:instructor) }
    it { is_expected.to have_and_belong_to_many(:student) }
  end

end


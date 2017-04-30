require 'rails_helper'

RSpec.describe Repository, type: :model do

  it { should be_mongoid_document }

  describe "fields" do
    it { should have_field(:title).of_type(String) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
  end

  describe "relations" do
    it { should have_many(:records) }
    it { should belong_to(:user) }
  end
end

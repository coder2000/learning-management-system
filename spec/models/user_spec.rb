require 'rails_helper'

RSpec.describe User, type: :model do
  it { should be_mongoid_document }

  describe 'fields' do
    it { is_expected.to have_field(:first_name).of_type(String) }
    it { is_expected.to have_field(:middle_name).of_type(String) }
    it { is_expected.to have_field(:last_name).of_type(String) }
    it { is_expected.to have_field(:gender).of_type(String) }
    it { is_expected.to have_field(:role).of_type(Integer) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:password).on(:create) }
    it { is_expected.to validate_presence_of(:password_confirmation).on(:create) }
    it { is_expected.to validate_confirmation_of(:password).on(:create) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe 'relations' do
    it { is_expected.to have_many(:requests) }
    it { is_expected.to have_many(:repositories) }
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_and_belong_to_many(:instructor_of) }
    it { is_expected.to have_and_belong_to_many(:member_of) }
  end

  describe '#fullname' do
    let(:user) { FactoryGirl.create(:student) }

    context 'when user have a last name' do
      it 'should return the full name of the user' do
        expect(user.full_name).to eq("#{user.first_name.titleize} #{user.last_name.titleize}")
      end
    end

    context "when user don't have a last name" do
      it 'should return the full name of the user' do
        user.update!(last_name: nil)
        expect(user.full_name).to eq(user.first_name.titleize.to_s)
      end
    end
  end

  describe '#part_of_the_group?' do
    let(:user) { FactoryGirl.create(:instructor) }
    let(:group) { FactoryGirl.create(:valid_group) }

    context 'when the user is in the group' do
      it 'should return true' do
        group = user.instructor_of.create(FactoryGirl.attributes_for(:valid_group))
        group.members << user
        user.member_of << group
        expect(user.part_of_the_group?(group.token)).to eq(true)
      end

      it 'should return false if user is not in the group' do
        expect(user.part_of_the_group?(group.token)).to eq(false)
      end
    end
  end
end

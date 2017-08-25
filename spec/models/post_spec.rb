require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be_mongoid_document }

  describe 'fields' do
    it { is_expected.to have_field(:content).of_type(String) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:video) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_and_belong_to_many(:attachments) }
  end

  describe '#owner' do
    let!(:post) { FactoryGirl.create(:valid_post) }
    let!(:user) { FactoryGirl.create(:student)    }

    context 'when the user is a owner of the topic' do
      it 'should return true' do
        expect(post.owner?(post.user.id)).to eq(true)
      end
    end

    context 'when the user is not the owner of the topic' do
      it 'should return false' do
        expect(post.owner?(user.id)).to eq(false)
      end
    end
  end
end

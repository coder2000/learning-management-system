require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to be_mongoid_document }

  describe 'fields' do
    it { is_expected.to have_field(:content).of_type(String) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:user).as_inverse_of(:comments) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe '#owner?' do
    let(:comment) { FactoryGirl.create(:valid_comment) }
    let(:user) { FactoryGirl.create(:student) }

    context 'when the user is owner of the comment' do
      it 'should return true' do
        expect(comment.owner?(comment.user.id)).to eq(true)
      end
    end

    context 'when user is not the owner of the comment' do
      it 'should return false' do
        expect(comment.owner?(user.id)).to eq(false)
      end
    end
  end
end

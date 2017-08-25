require 'rails_helper'

RSpec.describe Repository, type: :model do
  it { should be_mongoid_document }

  describe 'fields' do
    it { should have_field(:title).of_type(String) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'relations' do
    it { should have_many(:records) }
    it { should belong_to(:user) }
  end

  describe '#owner?' do
    let!(:repository) { FactoryGirl.create(:clean_repository) }
    let!(:user) { FactoryGirl.create(:instructor) }
    context 'when owner of the repository' do
      it 'should returns true' do
        expect(repository.owner?(repository.user.id)).to eq(true)
      end
    end

    context 'when not the owner of the repository' do
      it 'should return false' do
        expect(repository.owner?(user.id)).to eq(false)
      end
    end
  end
end

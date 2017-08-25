require 'rails_helper'

RSpec.describe Record, type: :model do
  it { should be_mongoid_document }

  describe 'fields' do
    it { should have_field(:title).of_type(String) }
    it { should have_field(:file_type).of_type(String) }
  end
end

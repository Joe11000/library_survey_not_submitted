require 'rails_helper'

RSpec.describe Record, type: :model do
  context 'valid factory' do 
    it 'has a valid factory' do 
      expect(FactoryBot.create :record).to be_valid
    end
  end

  context 'validations' do 
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:pages) }
    it { is_expected.to validate_presence_of(:dewey_decimal_code) }
    it { is_expected.to define_enum_for(:book_read_status).with_values([:unread, :half_read, :finished])}
  end
end

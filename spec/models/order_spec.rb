require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to :showtime }
  it { should belong_to :customer }

  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:cc_number) }
  it { should validate_presence_of(:cc_expiration) }
  it { should validate_presence_of(:cc_security_code) }

  it { should validate_numericality_of(:quantity).only_integer }
  it { should validate_length_of(:cc_security_code).is_at_least(3).is_at_most(4) }

  context 'entered valid credit card number' do
    let(:order) { create(:order) }

    it 'validates correctly' do
      expect(CreditCardValidations::Luhn.valid?(order.cc_number)).to be true
    end
  end

  context 'entered invalid credit card number' do
    let(:order) { build(:order, :invalid_cc_number) }

    it 'invalidates correctly' do
      expect(CreditCardValidations::Luhn.valid?(order.cc_number)).to be false
    end
  end
end

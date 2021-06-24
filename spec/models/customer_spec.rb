require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_many :orders }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }

  context 'entered valid email address' do
    let(:customer) { create(:customer) }

    it 'validates correctly' do
      expect(customer).to be_valid
    end
  end

  context 'entered invalid email address' do
    let(:customer) { build(:customer, :invalid_email) }

    it 'invalidates correctly' do
      expect(customer).not_to be_valid
    end
  end
end

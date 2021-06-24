require 'rails_helper'

RSpec.describe Showtime, type: :model do
  it { should belong_to :movie }
  it { should have_many :orders }

  it { should validate_presence_of(:date_time) }
  it { should validate_presence_of(:tickets_available) }
  it { should validate_presence_of(:cost) }

  it { should validate_numericality_of(:tickets_available).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:tickets_available).only_integer }
  it { should validate_numericality_of(:cost).is_greater_than_or_equal_to(0) }
end

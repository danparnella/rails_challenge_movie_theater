require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { should have_many :showtimes }

  it { should validate_presence_of(:name) }
end

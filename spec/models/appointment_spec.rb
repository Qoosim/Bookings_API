require 'rails_helper'

RSpec.describe Appointment, type: :model do
  # Association tests
  it { should belong_to(:user) }
  it { should belong_to(:bike) }

  # Validation tests
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:bike_id) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:time) }
  it { should validate_presence_of(:location) }
end

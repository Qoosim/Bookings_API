require 'rails_helper'

RSpec.describe Bike, type: :model do
  # Association tests
  it { should have_many(:appointment).dependent(:destroy) }
  it { should have_many(:users) } 
  
  # Validation tests
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:color) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:engine_capacity) }
  it { should validate_presence_of(:weight) }

end

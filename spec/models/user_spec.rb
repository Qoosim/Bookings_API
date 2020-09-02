require 'rails_helper'

RSpec.describe User, type: :model do

  # Association tests
  it { should have_many(:appointments).dependent(:destroy) }
  it { should have_many(:bikes) } 
  
   # Validation tests
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password_confirmation) }


end

require 'rails_helper'

# Test suite for the Demo model
RSpec.describe Demo, type: :model do
  # Association test
  # ensure Demo models relationships
  it { should have_many(:events).dependent(:destroy) }
  it { should have_many(:permissions).dependent(:destroy) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should belong_to(:user)}
  # Validation tests
  # ensure columns name and user are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
end


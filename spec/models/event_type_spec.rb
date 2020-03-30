require 'rails_helper'

RSpec.describe EventType, type: :model do
  # Association test
  # ensure Event models relationships
  it { should have_many(:events) }
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:icon) }
  it { should validate_uniqueness_of(:name) }
end

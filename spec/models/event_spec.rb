require 'rails_helper'

RSpec.describe Event, type: :model do
  # Association test
  # ensure Event models relationships
  it { should have_many(:comments).dependent(:destroy) }
  it { should belong_to(:user)}
  it { should belong_to(:demo)}
  it { should belong_to(:event_type)}
  # Validation tests
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:latitude) }
end

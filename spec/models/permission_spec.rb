require 'rails_helper'

RSpec.describe Permission, type: :model do
  # Association test
  # ensure model relationships
  it { should belong_to(:user) }
  it { should belong_to(:demo) }
  it do
    should define_enum_for(:role).
      with([:admin, :medic, :scout])
  end
  # Validation tests
  # it { should validate_uniqueness_of(:user).scoped_to([:demo, :role]).with_message('Permission exists already') }
end

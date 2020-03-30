require 'rails_helper'

RSpec.describe Comment, type: :model do
  # Association test
  it { should belong_to(:user)}
  it { should belong_to(:commentable)}

  # Validation tests
  it { should validate_presence_of(:content) }
end


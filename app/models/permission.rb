class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :demo
  enum role: [:admin, :medic, :scout]
end

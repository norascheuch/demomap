class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :demo
  enum status: [:admin, :medic, :scout]
end

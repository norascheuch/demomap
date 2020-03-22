class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :demo
  enum status: [:standard, :organizer, :admin, :medic, :scout]
end

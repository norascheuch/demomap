class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :demo
  enum role: [:admin, :medic, :scout]

  validates :user, uniqueness: { scope: [:demo, :role], message: 'Permission exists already'}
end

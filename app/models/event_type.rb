class EventType < ApplicationRecord
  has_many :events
  has_many :demos, through: :events

  validates :name, :icon, presence: true
  validates :name, uniqueness: true
end

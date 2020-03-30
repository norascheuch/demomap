class EventType < ApplicationRecord
  has_many :events
  validates :name, :icon, presence: true
  validates :name, uniqueness: true
end

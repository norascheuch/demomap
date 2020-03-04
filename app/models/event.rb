class Event < ApplicationRecord
  belongs_to :user
  belongs_to :demo
  belongs_to :event_type

  has_many :comments, as: :commentable

  validates :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end

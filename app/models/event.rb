class Event < ApplicationRecord
  before_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  belongs_to :demo
  belongs_to :event_type

  has_many :comments, as: :commentable

  geocoded_by :location
  validates :location, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end

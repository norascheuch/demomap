class Event < ApplicationRecord
  before_validation :geocode #, if: :will_save_change_to_location?

  belongs_to :user
  belongs_to :demo
  belongs_to :event_type

  has_many :comments, as: :commentable, dependent: :destroy

  geocoded_by :location
  validates :description, :location, :latitude, :longitude, presence: true
end

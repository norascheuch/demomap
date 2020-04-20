class Event < ApplicationRecord
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  belongs_to :demo
  belongs_to :event_type

  has_many :comments, as: :commentable, dependent: :destroy

  geocoded_by :location
  validates :description, :location, presence: true
end

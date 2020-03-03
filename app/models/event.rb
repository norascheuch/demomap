class Event < ApplicationRecord
  belongs_to :user
  belongs_to :demo
  belongs_to :event_type

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end

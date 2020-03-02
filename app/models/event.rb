class Event < ApplicationRecord
  belongs_to :user
  belongs_to :demon
  belongs_to :event_type
end

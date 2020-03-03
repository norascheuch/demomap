class Event < ApplicationRecord
  belongs_to :user
  belongs_to :demo
  belongs_to :event_type

  has_many :comments, as: :commentable
end

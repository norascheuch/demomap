class Demo < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :permissions, dependent: :destroy
  has_many :event_types, through: :events

  validates :name, :start_time, :end_time, presence: true

  after_create_commit :add_permission_and_start_end_events

  private

  def add_permission_and_start_end_events
    Permission.create!(user: self.user, demo: self, role: :admin)
    Event.create!(demo: self, event_type: EventType.find_by(name: 'Start'), start_time: self.start_time, user: self.user, description: 'Start of the demonstration', location: self.start_location)
    Event.create!(demo: self, event_type: EventType.find_by(name: 'End'), end_time: self.end_time, user: self.user, description: 'End of the demonstration', location: self.end_location)
  end

end

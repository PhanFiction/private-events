class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendees, through: :event_attendees, source: :event_attendee # return users that are attending
  has_many :event_attendees, foreign_key: :attendee_id

end
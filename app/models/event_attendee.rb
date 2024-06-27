class EventAttendee < ApplicationRecord
  belongs_to :event_attendee, class_name: 'User'
  belongs_to :attendee_events, class_name: 'Event'
end

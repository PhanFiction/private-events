class Event < ApplicationRecord
  belongs_to :creator, foreign_key: "creator_id", class_name: "User"
  has_many :event_attendees, foreign_key: :attended_events_id
  has_many :attendees, through: :event_attendees, source: :attendee # return users that are attending

  validates :title, length: { minimum: 4 }, presence: true
  validates :description, length: { minimum: 4 }, presence: true
  validates :location, presence: true
  validates :start_date, presence: { message: "Date must be given" }
  validates :start_time, presence: { message: "Time must be given" }

  scope :past_events, -> { where("DATE(start_date) <= ?", Date.today) }
  scope :upcoming_events, -> { where("DATE(start_date) >= ?", Date.today)}
end
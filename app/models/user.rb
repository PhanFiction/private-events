class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # event_attendees must load first before using the through: :event_attendees
  has_many :event_attendees, foreign_key: :attendee_id # return events the user attended
  has_many :all_events, through: :event_attendees, source: :attended_events # return events that were attended
  has_many :created_events, foreign_key: "creator_id", class_name: "Event" # returns created events

  validates :username, length: { minimum: 4 }
end

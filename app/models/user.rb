class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :created_events, foreign_key: "creator_id", class_name: 'Event' # returns created events
  has_many :attended_events, through: :event_attendees # return events that were attended
  has_many :event_attendees, foreign_key: :event_id # return all events that belong to the user
end

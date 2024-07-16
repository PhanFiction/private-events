class EventAttendeesController < ApplicationController
  def update
    @event = Event.find(params[:event_id])
    if @event.event_attendees&.exists?(attendee_id: current_user)
      @event.event_attendees.find_by(attendee_id: current_user.id).destroy
      puts "You have left the event"
    else
      @event.event_attendees.create!(attendee_id: current_user.id)
      puts "You have joined the event"
    end
  end
end

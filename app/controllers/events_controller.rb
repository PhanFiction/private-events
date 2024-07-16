class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @past_events = Event.past_events
    @upcoming_events = Event.upcoming_events
  end

  def show
    @event = Event.find(params[:id])
    @attending = @event.event_attendees&.exists?(attendee_id: current_user)
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
    # @event is set by the before_action filter
  end

  def create
    puts "Event Information #{params[:user_id]}, #{params[:event]}"
    user = User.find(params[:user_id])
    @event = user.created_events.build(event_params)
   
    if @event.save
      # Add current user who created event to event attendees
      @event.event_attendees.create!(attendee_id: current_user.id) # raise ActiveRecord validation fail err if model is invalid, else create

      # Redirect user back to root page
      redirect_to root_path, notice: 'Event was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end 
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # DELETE FROM table_name WHERE condition;
    EventAttendee.where("attended_events_id = ?", params[:event_id])
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully deleted.'
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :start_date, :start_time)
  end
end

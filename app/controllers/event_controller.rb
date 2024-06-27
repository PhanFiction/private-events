class EventController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    # @event is set by the before_action filter
  end

  def new
    @event = Event.new
  end

  def edit
    # @event is set by the before_action filter
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully deleted.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :body)
  end
end

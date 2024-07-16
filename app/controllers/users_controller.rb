class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:all_events]

  def show
    # @user is set by the before_action
    @user = User.find(params[:id])
  end

  def update
    if @event.update(event_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def all_events
    @user = User.find(params[:user_id])
    @events = @user.all_events
  end

  private
  
  def ensure_correct_user
    @user = User.find(params[:user_id])
    unless @user == current_user
      flash[:alert] = "You don't have permission to view this user's events"
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:first_name)
  end
end
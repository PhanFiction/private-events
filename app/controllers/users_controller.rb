class UsersController < ApplicationController
  before_action :set_user, only: [:edit]

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

  private

  def set_user 
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name)
  end
end
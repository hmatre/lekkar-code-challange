class UsersController < ApplicationController
  before_action :set_user, only: [:change_user_status]

  def index
    users = params[:status] ? User.where(status: params[:status]) : User.all
    render jsonapi: users
  end

  def change_user_status
    if @existing_user.update(status: params[:status], status_changed_time: Time.now, archive_by_id: current_user.id)
      render jsonapi: @existing_user
    else
      render json: { error: @existing_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @existing_user = User.find_by(id: params[:user_id])
    if @existing_user.nil?
      render json: {
          message: "User with id #{params[:user_id]} doesn't exists"
      }, status: :not_found
    elsif @user == @existing_user
      render json: {
          message: "You can't change your own status."
      }, status: :unprocessable_entity
    end
  end
end

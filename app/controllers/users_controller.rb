class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    if params[:id] == 'sign_out'
      sign_out_and_redirect
    else
      find_user
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def sign_out_and_redirect
    sign_out current_user
    redirect_to new_user_session_path
  end

  def find_user
    @user = User.find_by(id: params[:id])
    redirect_to users_path, alert: 'User not found' unless @user
  end
end

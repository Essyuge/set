class UsersController < ApplicationController
  def index 
    render json: User.all, status: :ok
  end
  def create 
    user=User.create!(user_params)
    sessions[:user_id]=user.id
    render json: user, status: :created
  end

  private
  def user_params
    params.permit(:username, :email, :password)
  end
end

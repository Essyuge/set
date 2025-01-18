class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  def create
    user= User.find_by_username(params[:username])
if user && user.authenticate(params[:password])
session[:user_id]=user.id
 render json: { message: "Login successful" }, status: :ok
else 
render json: "invalid credentials", status: :unauthorized
  end
end

  def destroy
    session.delete(:user_id) # Remove the user ID from the session
  render json: { message: "Logout successful" }, status: :ok
  end
end

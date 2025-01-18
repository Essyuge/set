class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  protect_from_forgery with: :null_session
  
  allow_browser versions: :modern
rescue_from ActiveRecord::RecordNotFound, with: :RecordNotFound
rescue_from ActiveRecord::RecordInvalid, with: :RecordInvalid

private
def RecordNotFound(error)
  render json: {error: error.message}, status: :not_found
end

def RecordInvalid(invalid)
  render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity
end
  
end

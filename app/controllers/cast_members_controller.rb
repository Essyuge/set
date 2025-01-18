class CastMembersController < ApplicationController
  def index
    render json: CastMember.all , status: :ok
  end
  def create 
    castmember= CastMember.create!(castmember_params)
    render json: castmember, status: :created
  end

  def destroy 
    castmember= CastMember.find(params[:id])
    castmember.destroy
    head :no_content
  end

  private
  def castmember_params
    params.permit(:role, :name, :production_id)
  end
end

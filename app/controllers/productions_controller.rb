class ProductionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_production, only: [:show, :update, :destroy]
  
  def index
  render json: Production.all, status: :ok
  end

  def show 

  render json: @production, status: :ok
  end

  def create
    production= Production.create!(production_params)
    render json: production, status: :created
  end

  def update 
   
    @production.update!(production_params) 
    render json: @production, status: :ok
  end

  def destroy 

    @production.destroy
    head :no_content
  end

  private

  def production_params
    params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
  end

  def find_production
    production= Production.find(params[:id])
  end
  
end

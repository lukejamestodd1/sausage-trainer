class Api::ActivityTypesController < ApplicationController
  def index
    @activity_types = ActivityType.all
    render json: @activity_types, status: 200
  end

  def show
    @activity_type = ActivityType.find(params[:id])
    render json: @activity_type, status: 200
  end
end

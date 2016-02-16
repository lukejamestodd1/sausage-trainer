class Api::ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
    render json: @activities, status: 200
  end

  def show
    @activity = Activity.find(params[:id])
    render json: @activity, status: 200
  end
end

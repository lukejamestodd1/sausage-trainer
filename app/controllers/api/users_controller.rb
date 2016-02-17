class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: 200
  end

  def activities
    @activities = Activity.where( user_id: params[:id] )
    render json: @activities, methods: [ :venue_details, :activity_type_name, :participant_count ], status: 200
  end
end

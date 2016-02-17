class Api::ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
    render json: @activities, methods: [ :venue_details, :activity_type_name, :participant_count ], status: 200
  end

  def show
    @activity = Activity.find(params[:id])
    render json: @activity, methods: [ :venue_details, :activity_type_name, :participant_count ], status: 200
  end

  def participants
    participants = Participant.where( activity_id: params[:id] )
    @users = []
    participants.each do |participant|
      @users << User.find( participant.user_id )
    end
    render json: @users, status: 200
  end
end

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

  def contacts_list
    contacts = Contact.where( owner_id: params[:id] )
    @users = []
    contacts.each do |user|
      @users << User.find(user.user_id)
    end
    render json: @users, status: 200
  end

  def groups
    entries = GroupEntry.where( user_id: params[:id] )
    @groups = []
    entries.each do |entry|
      @groups << Group.find( entry.group_id )
    end
    render json: @groups, methods: [ :creator ], status: 200
  end

  def current
    @current_user = current_user
    render json: @current_user, status: 200
  end
end

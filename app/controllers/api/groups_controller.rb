class Api::GroupsController < ApplicationController
  def index
    @groups = Group.all
    render json: @groups, methods: [ :creator ], status: 200
  end

  def show
    @group = Group.find(params[:id])
    render json: @group, methods: [ :creator ], status: 200
  end

  def members
    entries = GroupEntry.where( group_id: params[:id] )
    @members = []
    entries.each do |entry|
      @members << User.find(entry.user_id)
    end
    render json: @members, status: 200
  end
end

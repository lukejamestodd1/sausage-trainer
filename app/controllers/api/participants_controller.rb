class Api::ParticipantsController < ApplicationController
  def index
    @participants = Participant.all
    render json: @participants, status: 200
  end

  def show
    @participant = Participant.find(params[:id])
    render json: @participant, status: 200
  end
end

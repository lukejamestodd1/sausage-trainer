class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity_type
  belongs_to :venue
  has_many :participants

  def venue_details
    venue
  end

  def activity_type_name
    activity_type.name
  end

  def participant_count
    participants.count
  end
end

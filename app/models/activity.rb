class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity_type
  belongs_to :venue
  has_many :participants

  def venue_details
    data = {
      name: venue.name,
      address: venue.address,
      description: venue.description,
      geo_lat: venue.geo_lat,
      geo_lng: venue.geo_lng
    }
  end

  def activity_type_name
    activity_type.name
  end

  def participant_count
    participants.count
  end
end

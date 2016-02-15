class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity_type
  belongs_to :venue
  has_many :participants
end

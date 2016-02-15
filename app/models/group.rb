class Group < ActiveRecord::Base
  belongs_to :user
  has_many :group_entries
end

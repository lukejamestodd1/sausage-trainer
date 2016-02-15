class User < ActiveRecord::Base
  has_many :activities
  has_many :participants
  has_many :groups
  has_many :group_entries
  has_many :contacts
  has_secure_password
end

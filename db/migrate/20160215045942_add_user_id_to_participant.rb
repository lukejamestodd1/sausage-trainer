class AddUserIdToParticipant < ActiveRecord::Migration
  def change
    add_reference :participants, :user, index: true
    add_foreign_key :participants, :users
  end
end

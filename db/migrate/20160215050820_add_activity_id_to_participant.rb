class AddActivityIdToParticipant < ActiveRecord::Migration
  def change
    add_reference :participants, :activity, index: true
    add_foreign_key :participants, :activities
  end
end

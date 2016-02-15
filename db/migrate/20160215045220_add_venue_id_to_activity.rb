class AddVenueIdToActivity < ActiveRecord::Migration
  def change
    add_reference :activities, :venue, index: true
    add_foreign_key :activities, :venues
  end
end

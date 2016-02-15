class AddActivityTypeIdToActivity < ActiveRecord::Migration
  def change
    add_reference :activities, :activity_type, index: true
    add_foreign_key :activities, :activity_types
  end
end

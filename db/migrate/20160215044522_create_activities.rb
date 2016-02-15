class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.time :start_time
      t.float :duration
      t.text :description
      t.boolean :proposed
      t.boolean :confirmed
      t.boolean :requires_payment
      t.float :cost

      t.timestamps null: false
    end
  end
end

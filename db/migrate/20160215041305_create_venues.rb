class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.text :description
      t.float :geo_lat
      t.float :geo_lng

      t.timestamps null: false
    end
  end
end

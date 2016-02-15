class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.boolean :instructor
      t.boolean :student
      t.string :photo_url
      t.string :local_timezone

      t.timestamps null: false
    end
  end
end

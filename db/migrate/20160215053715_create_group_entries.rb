class CreateGroupEntries < ActiveRecord::Migration
  def change
    create_table :group_entries do |t|

      t.timestamps null: false
    end
  end
end

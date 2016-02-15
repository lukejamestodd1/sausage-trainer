class AddUserIdToGroupEntry < ActiveRecord::Migration
  def change
    add_reference :group_entries, :user, index: true
    add_foreign_key :group_entries, :users
  end
end

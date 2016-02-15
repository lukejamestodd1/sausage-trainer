class AddGroupIdToGroupEntry < ActiveRecord::Migration
  def change
    add_reference :group_entries, :group, index: true
    add_foreign_key :group_entries, :groups
  end
end

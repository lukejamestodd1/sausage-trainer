class AddMaxSizeColumnToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :max_size, :integer
  end
end

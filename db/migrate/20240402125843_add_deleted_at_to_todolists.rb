class AddDeletedAtToTodolists < ActiveRecord::Migration[7.1]
  def change
    add_column :todolists, :deleted_at, :datetime
    add_index :todolists, :deleted_at
  end
end

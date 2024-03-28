class AddDefaultToStatusInTodolists < ActiveRecord::Migration[7.1]
  def change
    change_column_default :todolists, :status, 0
  end
end

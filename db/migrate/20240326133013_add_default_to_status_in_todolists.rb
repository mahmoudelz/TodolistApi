class AddDefaultToStatusInTodolists < ActiveRecord::Migration[7.1]
  def up
    change_column_default :todolists, :status, 0
  end

  def down
    change_column_default :todolists, :status, nil
  end
end

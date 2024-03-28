class CreateTodolists < ActiveRecord::Migration[7.1]
  def change
    create_table :todolists do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end

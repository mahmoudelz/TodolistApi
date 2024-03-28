class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.references :todolist, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end

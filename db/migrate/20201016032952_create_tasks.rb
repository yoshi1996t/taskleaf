class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name,  null: false
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end
end

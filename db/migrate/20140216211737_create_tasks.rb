class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.boolean :completed
      t.datetime :deadline
      t.references :priority, index: true
      t.references :creator, index: true

      t.timestamps
    end
  end
end

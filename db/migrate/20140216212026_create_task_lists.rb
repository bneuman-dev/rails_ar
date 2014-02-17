class CreateTaskLists < ActiveRecord::Migration
  def change
    create_table :task_lists do |t|
      t.references :list, index: true
      t.references :task, index: true

      t.timestamps
    end
  end
end

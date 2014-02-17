class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.references :creator, index: true

      t.timestamps
    end
  end
end

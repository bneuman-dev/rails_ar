class CreateListUsers < ActiveRecord::Migration
  def change
    create_table :list_users do |t|
      t.string :name
      t.string :type
      t.references :creator, index: true

      t.timestamps
    end
  end
end

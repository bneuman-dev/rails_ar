class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.references :group, index: true
      t.references :user, index: true
      t.integer :access_level

      t.timestamps
    end
  end
end

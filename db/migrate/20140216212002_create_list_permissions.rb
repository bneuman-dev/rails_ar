class CreateListPermissions < ActiveRecord::Migration
  def change
    create_table :list_permissions do |t|
      t.references :list_user, index: true
      t.references :list, index: true
      t.integer :permission_level

      t.timestamps
    end
  end
end

class AddIsAdminToUserModel < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.boolean :is_admin, :default => false, :null => false
    end
  end
end

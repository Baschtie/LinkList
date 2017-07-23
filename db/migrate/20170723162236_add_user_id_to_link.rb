class AddUserIdToLink < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :belongs_to, :integer
  end
end

class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.integer :belongs_to, null: false
      t.string :name, null: false
      t.string :description
      t.string :url, null: false
      t.string :tags
      t.boolean :does_expire
      t.date :experies_on

      t.timestamps
    end

    add_index :links, :url, unique: true

  end
end

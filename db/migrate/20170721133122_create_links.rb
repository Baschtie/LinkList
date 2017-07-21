class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :category
      t.boolean :does_expire
      t.date :experies_on

      t.timestamps
    end
  end
end

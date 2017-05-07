class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.string :photo
      t.integer :views
      t.string :section

      t.timestamps null: false
    end
  end
end

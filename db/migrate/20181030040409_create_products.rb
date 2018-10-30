class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :quantity
      t.string :title
      t.text :description
      t.decimal :cost_per_unit
      t.string :pickup_location
      t.datetime :expiry
      t.string :food_category
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateCars < ActiveRecord::Migration[8.1]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :name
      t.integer :year

      t.timestamps
    end
  end
end

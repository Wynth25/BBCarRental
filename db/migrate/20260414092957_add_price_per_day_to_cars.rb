class AddPricePerDayToCars < ActiveRecord::Migration[8.1]
  def change
    add_column :cars, :price_per_day, :integer
  end
end

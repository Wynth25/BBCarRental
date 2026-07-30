class AddCountToCars < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :count, :integer, default: 1
  end
end
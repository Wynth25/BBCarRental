class ChangeCountDefaultForCars < ActiveRecord::Migration[7.1]
  def change
    change_column_default :cars, :count, 1
  end
end
class ChangeColumnFromPlaces < ActiveRecord::Migration[5.1]
  def change
    remove_column :places, :lat, :intger
    remove_column :places, :lng, :intger
    add_column :places, :lat, :float
    add_column :places, :lng, :float
  end
end

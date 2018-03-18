class AddColumnForPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :start_date, :date
    add_column :places, :last_date, :date
  end
end

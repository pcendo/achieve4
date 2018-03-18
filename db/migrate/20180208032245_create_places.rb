class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name
      t.date :start_date
      t.date :last_date
      t.string :center
      t.integer :lat
      t.integer :lng
      t.string :zoom
      t.integer :user_id
    end
  end
end

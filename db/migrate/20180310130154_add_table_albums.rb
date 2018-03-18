class AddTableAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.text :image
      t.text :content
      t.integer :place_id
      t.float :latitude
      t.float :longitude
    end
  end
end

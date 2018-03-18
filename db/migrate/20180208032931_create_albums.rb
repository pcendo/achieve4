class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.text :image
      t.text :content
      t.integer :place_id
      t.string :marker
      t.integer :lat
      t.integer :lng
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end

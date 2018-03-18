class ChangeColumnFromAlbums < ActiveRecord::Migration[5.1]
  def change
    remove_column :albums, :lat, :intger
    remove_column :albums, :lng, :intger
    add_column :albums, :lat, :float
    add_column :albums, :lng, :float
  end
end

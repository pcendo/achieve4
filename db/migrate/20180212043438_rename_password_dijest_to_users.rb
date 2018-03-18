class RenamePasswordDijestToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :password_dijest, :password_digest
  end
end

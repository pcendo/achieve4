class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_dijest
      t.text :image
      t.datetime :created_at
      t.datetime :update_at
    end
  end
end

class Place < ApplicationRecord
    
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user

    has_many :albums, dependent: :destroy
    belongs_to :user

end

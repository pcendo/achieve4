class User < ApplicationRecord

    validates :email, presence: true, length: { maximum: 255 }, uniqueness: true,
                      format: { with: /\A[\w+\-.]+@[a-z\d\.]+\.[a-z]+\z/i }
    validates :name, presence: true, length: { maximum: 30 }

    before_save {email.downcase! }
    has_secure_password
    validates :password, presence:true, length: {minimum: 6 }
    
    has_many :places, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorite_places, through: :favorites, source: :place

    mount_uploader :image, ImageUploader

end

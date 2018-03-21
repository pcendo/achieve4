class Album < ApplicationRecord
    
    validates :image, presence: true
    
    belongs_to :place
    
    mount_uploader :image, ImageUploader

end

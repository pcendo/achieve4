class Album < ApplicationRecord
    
    belongs_to :place
    
    mount_uploader :image, ImageUploader

end

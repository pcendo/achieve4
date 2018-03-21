class Place < ApplicationRecord
    
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user

    has_many :albums, dependent: :destroy
    belongs_to :user

    validates :start_date, :presence => true
    validates :last_date, :presence => true
    validate :start_last_check

    def start_last_check
      errors.add(:last_date, "の日付を正しく入力して下さい。") unless
      self.start_date <= self.last_date
    end 

end

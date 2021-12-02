class Topic < ApplicationRecord
    validates :body,presence: true
    validates :title,presence: true
    validates :user_id,presence: true
    
    def self.search(keyword)
        where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
    end
end
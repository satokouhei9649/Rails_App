class Choice < ApplicationRecord
    validates :content,presence: true
    validates :votes, presence: true
   
end

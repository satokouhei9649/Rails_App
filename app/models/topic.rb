class Topic < ApplicationRecord
    validates :body,presence: true
    validates :title,presence: true
    validates :user_id,presence: true
end
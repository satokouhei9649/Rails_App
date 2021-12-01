class Done < ApplicationRecord
    validates :done_user, presence: true
    validates :done_topic, presence: true
    validates :done, presence: true
end

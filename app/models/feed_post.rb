class FeedPost < ApplicationRecord
    belongs_to :user, optional: false
    validates :content, length: {minimum: 1, maximum: 250}, allow_blank: false
end

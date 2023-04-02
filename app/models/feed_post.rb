class FeedPost < ApplicationRecord
    belongs_to :user, optional: false
    validates :content, length: {minimum: 1, maximum: 250}, allow_blank: false

    has_many :feed_post_comments 

    def as_json(options={})
        super(options).merge({comments: self.feed_post_comments})
    end
end

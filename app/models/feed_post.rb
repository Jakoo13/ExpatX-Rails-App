class FeedPost < ApplicationRecord
    belongs_to :user, optional: false
    validates :content, length: {minimum: 1, maximum: 250}, allow_blank: false

    has_many :feed_post_comments 

    def as_json(options={})
        super(options).merge({
            # The extra as_json removes updated_at from the json
            comments: self.feed_post_comments().as_json(options)
        })
    end
end

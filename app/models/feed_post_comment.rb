class FeedPostComment < ApplicationRecord
    belongs_to :user, optional: false
    belongs_to :feed_post, optional: false
    validates :comment, length: {minimum: 1, maximum: 250}, allow_blank: false
    validates :user_id, presence: true
    validates :feed_post_id, presence: true

    def as_json(options={})
        super(options).merge({
            user: self.user().as_json(options),
          
        })
        end
   
end

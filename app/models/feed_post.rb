class FeedPost < ApplicationRecord
    belongs_to :user, optional: false
    validates :content, length: {minimum: 1, maximum: 250}, allow_blank: false
    validates :language, length: {minimum: 1, maximum: 30}, allow_blank: false, inclusion: { in: %w(English Spanish French German Italian Portuguese Russian Chinese Japanese Korean Arabic Hindi Bengali Turkish Vietnamese), message: "%{value} is not a valid language" }

    has_many :feed_post_comments 

    def as_json(options={})
        super(options).merge({
            # The extra as_json removes updated_at from the json
            comments: self.feed_post_comments().as_json(options)
          
        })
        super(options).merge({
            user: self.user().as_json(options)
          
        })
    end
end

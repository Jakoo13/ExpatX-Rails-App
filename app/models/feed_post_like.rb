class FeedPostLike < ApplicationRecord
  belongs_to :user
  belongs_to :feed_post

  validates :user_id, presence: true
  validates :feed_post_id, presence: true

    def as_json(options={})
      super(options).merge({
          user: self.user().as_json(options),
        
      })

  end
end

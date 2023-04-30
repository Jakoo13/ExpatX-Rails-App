class CreateFeedPostLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :feed_post_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :feed_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end

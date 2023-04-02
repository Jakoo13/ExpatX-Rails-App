class CreateFeedPostComments < ActiveRecord::Migration[7.0]
  def change
    create_table :feed_post_comments do |t|
      t.text :comment
      t.references :feed_post
      t.references :user
      t.timestamps
    end
  end
end

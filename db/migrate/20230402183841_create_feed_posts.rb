class CreateFeedPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :feed_posts do |t|
      t.text :content
      t.string :language
      t.integer :likes, default: 0
      t.references :user
      t.timestamps
    end
  end
end

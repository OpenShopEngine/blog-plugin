class AddPublishedToBlogPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :blog_posts, :published, :string
  end
end

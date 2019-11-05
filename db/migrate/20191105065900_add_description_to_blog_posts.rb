class AddDescriptionToBlogPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :blog_posts, :description, :string
  end
end

class AddPostIndexToBlogPostBlocks < ActiveRecord::Migration[6.0]
  def change
    add_column :blog_post_blocks, :post_index, :decimal
  end
end

class CreateBlogPostBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_post_blocks do |t|
      t.string :block_type
      t.string :content

      t.timestamps
    end
  end
end

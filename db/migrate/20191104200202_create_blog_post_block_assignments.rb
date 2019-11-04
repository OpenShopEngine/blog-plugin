class CreateBlogPostBlockAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_post_block_assignments do |t|
      t.references :post, null: false, foreign_key: true
      t.references :block, null: false, foreign_key: true

      t.timestamps
    end
  end
end

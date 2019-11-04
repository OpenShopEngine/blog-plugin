module Blog
  class Post < ApplicationRecord
    has_many :blog_post_assignments
    has_many :post_blocks, through: :blog_post_assignments
  end
end

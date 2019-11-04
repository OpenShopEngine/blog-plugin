module Blog
  class PostBlockAssignment < ApplicationRecord
    belongs_to :post
    belongs_to :block
  end
end

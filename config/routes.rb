Blog::Engine.routes.draw do
  resources :post_block_assignments
  resources :post_blocks
  resources :posts
end

require 'test_helper'

module Blog
  class PostBlocksControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @post_block = blog_post_blocks(:one)
    end

    test "should get index" do
      get post_blocks_url, as: :json
      assert_response :success
    end

    test "should create post_block" do
      assert_difference('PostBlock.count') do
        post post_blocks_url, params: { post_block: { content: @post_block.content, post_id: @post_block.post_id, type: @post_block.type } }, as: :json
      end

      assert_response 201
    end

    test "should show post_block" do
      get post_block_url(@post_block), as: :json
      assert_response :success
    end

    test "should update post_block" do
      patch post_block_url(@post_block), params: { post_block: { content: @post_block.content, post_id: @post_block.post_id, type: @post_block.type } }, as: :json
      assert_response 200
    end

    test "should destroy post_block" do
      assert_difference('PostBlock.count', -1) do
        delete post_block_url(@post_block), as: :json
      end

      assert_response 204
    end
  end
end

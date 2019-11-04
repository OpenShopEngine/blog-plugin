require 'test_helper'

module Blog
  class PostBlockAssignmentsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @post_block_assignment = blog_post_block_assignments(:one)
    end

    test "should get index" do
      get post_block_assignments_url, as: :json
      assert_response :success
    end

    test "should create post_block_assignment" do
      assert_difference('PostBlockAssignment.count') do
        post post_block_assignments_url, params: { post_block_assignment: { block_id: @post_block_assignment.block_id, post_id: @post_block_assignment.post_id } }, as: :json
      end

      assert_response 201
    end

    test "should show post_block_assignment" do
      get post_block_assignment_url(@post_block_assignment), as: :json
      assert_response :success
    end

    test "should update post_block_assignment" do
      patch post_block_assignment_url(@post_block_assignment), params: { post_block_assignment: { block_id: @post_block_assignment.block_id, post_id: @post_block_assignment.post_id } }, as: :json
      assert_response 200
    end

    test "should destroy post_block_assignment" do
      assert_difference('PostBlockAssignment.count', -1) do
        delete post_block_assignment_url(@post_block_assignment), as: :json
      end

      assert_response 204
    end
  end
end

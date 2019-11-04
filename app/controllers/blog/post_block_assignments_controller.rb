require_dependency "blog/application_controller"

module Blog
  class PostBlockAssignmentsController < ApplicationController
    before_action :set_post_block_assignment, only: [:show, :update, :destroy]

    # GET /post_block_assignments
    def index
      @post_block_assignments = PostBlockAssignment.all

      render json: @post_block_assignments
    end

    # GET /post_block_assignments/1
    def show
      render json: @post_block_assignment
    end

    # POST /post_block_assignments
    def create
      @post_block_assignment = PostBlockAssignment.new(post_block_assignment_params)

      if @post_block_assignment.save
        render json: @post_block_assignment, status: :created, location: @post_block_assignment
      else
        render json: @post_block_assignment.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /post_block_assignments/1
    def update
      if @post_block_assignment.update(post_block_assignment_params)
        render json: @post_block_assignment
      else
        render json: @post_block_assignment.errors, status: :unprocessable_entity
      end
    end

    # DELETE /post_block_assignments/1
    def destroy
      @post_block_assignment.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post_block_assignment
        @post_block_assignment = PostBlockAssignment.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def post_block_assignment_params
        params.require(:post_block_assignment).permit(:post_id, :block_id)
      end
  end
end

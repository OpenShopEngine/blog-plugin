require_dependency "blog/application_controller"

module Blog
  class PostBlocksController < ApplicationController
    before_action :set_post_block, only: [:show, :update, :destroy]

    # GET /post_blocks
    def index
      @post_blocks = PostBlock.all

      render json: @post_blocks
    end

    # GET /post_blocks/1
    def show
      render json: @post_block
    end

    # POST /post_blocks
    def create
      @post_block = PostBlock.new(post_block_params)

      if @post_block.save
        render json: @post_block, status: :created, location: @post_block
      else
        render json: @post_block.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /post_blocks/1
    def update
      if @post_block.update(post_block_params)
        render json: @post_block
      else
        render json: @post_block.errors, status: :unprocessable_entity
      end
    end

    # DELETE /post_blocks/1
    def destroy
      @post_block.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post_block
        @post_block = PostBlock.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def post_block_params
        params.require(:post_block).permit(:type, :content, :post_id)
      end
  end
end

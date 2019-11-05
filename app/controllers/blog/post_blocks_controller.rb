require_dependency "blog/application_controller"

module Blog
  class PostBlocksController < ApplicationController
    before_action :set_post_block, only: [:show, :update, :destroy]
    before_action :current_user, only: [:index, :show, :create, :update, :destroy]

    # GET /post_blocks
    def index
      if @current_user.role? :admin
        @post_blocks = PostBlock.all
        render json: @post_blocks
      end
    end

    # GET /post_blocks/1
    def show
      if @current_user.role? :admin
        render json: @post_block
      end
    end

    # POST /post_blocks
    def create
      if @current_user.role? :admin
        @post_block = PostBlock.new(post_block_params)

        if @post_block.save
          render json: @post_block, status: :created, location: @post_block
        else
          render json: @post_block.errors, status: :unprocessable_entity
        end
      end
    end

    # PATCH/PUT /post_blocks/1
    def update
      if @current_user.role? :admin
        if @post_block.update(post_block_params)
          render json: @post_block
        else
          render json: @post_block.errors, status: :unprocessable_entity
        end
      end
    end

    # DELETE /post_blocks/1
    def destroy
      if @current_user.role? :admin
        @post_block.destroy
      end
    end

    private
      def current_user
        @current_user = User.find(session[:user_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_post_block
        @post_block = PostBlock.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def post_block_params
        params.require(:post_block).permit(:block_type, :content, :blog_post_id, :post_index)
      end
  end
end

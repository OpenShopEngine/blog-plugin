require_dependency "blog/application_controller"

module Blog
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]
    before_action :current_user, only: [:index, :create, :update, :destroy]

    # GET /posts
    def index
      if @current_user != nil
        if @current_user.role? :admin
          @posts = Post.all
        else
          @posts = Post.where(:published => 'PUBLISHED')
        end
      else
        @posts = Post.where(:published => 'PUBLISHED')
      end

      render json: @posts
    end

    # GET /posts/1
    def show
      @blocks = PostBlock.where(:blog_post_id => @post.id).order(:post_index)

      render json: {
        post: @post,
        blocks: @blocks
      }
    end

    # POST /posts
    def create
      if @current_user.role? :admin
        @post = Post.new(post_params)

        if @post.save
          render json: @post, status: :created, location: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      else
        render json "Only for admins!", status: :bad_request
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @current_user.role? :admin
        if @post.update(post_params)
          render json: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      else
        render json "Only for admins!", status: :bad_request
      end
    end

    # DELETE /posts/1
    def destroy
      if @current_user.role? :admin
        @post.destroy
      else
        render json "Only for admins!", status: :bad_request
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      def current_user
        begin
          @current_user = User.find(session[:user_id])
        rescue
          @current_user = nil
        end
      end

      # Only allow a trusted parameter "white list" through.
      def post_params
        params.require(:post).permit(:title, :published, :description)
      end
  end
end

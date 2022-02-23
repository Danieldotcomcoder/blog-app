class PostsController < ApplicationController
  before_action :current_user, only: [:create]

  def index
    @user = User.find(params[:user_id])
    @posts_list = @user.recent_posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = @current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        flash[:success] = 'Post saved successfully'
        format.html { redirect_to "/users/#{@current_user.id}/posts" }
      else
        flash.now[:error] = 'Error: Post could not be saved'
        format.html { render :new }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

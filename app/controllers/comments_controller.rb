class CommentsController < ApplicationController
  before_action :current_user, only: [:create]

  def create
    @comment = current_user.comments.new(comments_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      @comment.update_comments_counter
      redirect_to user_post_path(current_user.id, Post.find(params[:post_id]))
    else
      render :new
    end
  end

  def comments_params
    params.require(:comment).permit(:Text)
  end
end

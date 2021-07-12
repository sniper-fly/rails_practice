class CommentController < ApplicationController
  before_action :set_comment, only: %i[ edit destroy ]

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.content.empty?
      redirect_to blog_url(@comment.blog_id), flash: { danger: "Comment cannot be empty."}
    elsif @comment.save
      redirect_to blog_url(@comment.blog_id), notice: "Your comment was added."
    else
      redirect_to blog_url(@comment.blog_id), status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    blog_id = @comment.blog_id
    @comment.destroy
    redirect_to blog_url(blog_id), notice: "The comment was deleted."
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :blog_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end

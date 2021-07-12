class CommentController < ApplicationController
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

  private

  def comment_params
    params.require(:comment).permit(:content, :blog_id)
  end

end

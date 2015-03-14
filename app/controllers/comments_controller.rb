class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    if @post.comments.create(comment_params)
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      redirect_to @post, alert: 'Error creating comment.'
    end 
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment
      @comment.destroy
      redirect_to @post, notice: 'Comment was successfully destroyed.'
    else
      redirect_to @post, alert: 'Error destroying comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end

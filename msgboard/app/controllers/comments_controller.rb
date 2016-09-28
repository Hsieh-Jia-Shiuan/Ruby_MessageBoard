class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:content))

    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post)
    else
      flash[:errorcomment] = "Please enter your comment!"
      # render 'posts/show'
      redirect_to post_path(@post)
    end

  end
end
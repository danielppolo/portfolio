class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find_by(title: params[:project_title] || params[:story_title] )
    @comment.post = @post
    if @comment.save
      respond_to do |format|
        format.html { redirect_to project_path(@post) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'projects/show' || 'stories/show'}
        format.js  # <-- idem
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :content, :email)
  end

end

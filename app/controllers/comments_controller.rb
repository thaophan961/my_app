class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @comment = Comment.paginate(page: params[:page])
  end

  def create
  	@comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to micropost_path params[:comment][:micropost_id]
    else
      redirect_to :back
    end
  end

  def destroy
  	@comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || @micropost
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :micropost_id)
    end

end

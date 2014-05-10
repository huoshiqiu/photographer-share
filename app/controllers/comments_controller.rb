class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create

    photo = Photo.where(id: params[:photo_id]).first
    comment = Comment.create(photo: photo, user: current_user)
    if comment.update_attributes comment_params
      flash[:notice] = '评论保存成功'
    else
      flash[:error] = '评论保存失败'
    end

    redirect_to current_user
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end

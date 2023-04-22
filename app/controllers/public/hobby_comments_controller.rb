class Public::HobbyCommentsController < ApplicationController

  def create
    hobby = Hobby.find(params[:hobby_id])
    comment = current_user.hobby_comments.new(hobby_comment_params)
    comment.hobby_id = hobby.id
    comment.save
    redirect_to hobby_path(hobby)
  end

def destroy
  HobbyComment.find_by(id: params[:id], hobby_id: params[:hobby_id]).destroy
  redirect_to hobby_path(params[:hobby_id])
end

  private

  def hobby_comment_params
    params.require(:hobby_comment).permit(:comment)
  end
end

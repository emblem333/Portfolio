class Admin::HobbyCommentsController < ApplicationController

def destroy
  HobbyComment.find_by(id: params[:id], hobby_id: params[:hobby_id]).destroy
  redirect_to admin_hobby_path(params[:hobby_id])
end

  private

  def hobby_comment_params
    params.require(:hobby_comment).permit(:comment)
  end
end

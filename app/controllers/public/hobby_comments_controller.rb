class Public::HobbyCommentsController < ApplicationController
  def create
    @hobby = Hobby.find(params[:hobby_id])
    @comment = current_user.hobby_comments.new(hobby_comment_params)
    @comment.hobby_id = @hobby.id
    @comment.save
    redirect_to hobby_path(@hobby)
      #redirect_to request.referer
      #redirect_to request.refererを使うと簡単に同じページに遷移 #book_path(book)
      #@book_comment = BookComment.new
  end

def destroy
  if HobbyComment.find_by(id: params[:id], hobby_id: params[:hobby_id]).destroy # 対象のHobbyCommentを検索
    flash.now[:alert] = '投稿を削除しました'
  else
    flash.now[:alert] = '投稿が見つかりませんでした' # HobbyCommentが見つからない場合のエラーメッセージ
  end
  redirect_to hobby_path(@hobby)
end

  private

  def hobby_comment_params
    params.require(:hobby_comment).permit(:comment)
  end
end

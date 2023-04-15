class Public::FavoritesController < ApplicationController
  def create
    @hobby_favorite = Favorite.new(user_id: current_user.id, post_id: params[:hobby_id])
    @hobby_favorite.save
    redirect_to hobby_path(params[:hobby_id])
  end
end

class Public::FavoritesController < ApplicationController
  def create
    @hobby_favorite = Favorite.new(user_id: current_user.id, hobby_id: params[:hobby_id])
    @hobby_favorite.save
    redirect_to hobby_path(params[:hobby_id])
  end

  def destroy
    @hobby_favorite = Favorite.find_by(user_id: current_user.id, hobby_id: params[:hobby_id])
    @hobby_favorite.destroy
    redirect_to hobby_path(params[:hobby_id])
  end
end

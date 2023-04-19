class Admin::HobbiesController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_hobby, only: [:show, :edit, :update]

  def new
    @hobby = Hobby.new
  end

  def index
    @genres = Genre.all
    @hobbies = Hobby.all
    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      all_hobbies = @genre.hobbies
    else
      all_hobbies = Hobby.includes(:genre)
    end
    @hobbies = all_hobbies
    @all_hobbies_count = all_hobbies.count
  end

  def create
    @item = Item.new(item_params)
    @item.save ? (redirect_to admin_item_path(@item)) : (render :new)
  end

  def show
    @genres = Genre.only_active
    @user = current_user.id
    @hobby_comment = HobbyComment.new
  end

  def edit
  end

  def update
    @hobby.update(item_params) ? (redirect_to admin_item_path(@hobby)) : (render :edit)
  end

  def destroy
    @hobby.destroy
    redirect_to hobbies_path
  end

  private

  def hobby_params
    params.require(:hobby).permit(:genre_id, :name, :introduction, :image, :is_active, :user_id, :tag)
  end

  def ensure_item
    @hobby = Hobby.find(params[:id])
  end
end
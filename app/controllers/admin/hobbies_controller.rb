class Admin::HobbiesController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_hobby, only: [:show, :edit, :destroy]

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
  end

  def show
    @genres = Genre.only_active
  end

  def edit
  end

  def update
  end

  def destroy
    @hobby.destroy(admin_hobby_path)
    redirect_to admin_hobbies_path
  end

  private

  def hobby_params
    params.require(:hobby).permit(:genre_id, :name, :introduction, :image, :is_active, :user_id, :tag)
  end

  def ensure_hobby
    @hobby = Hobby.find(params[:id])
  end
end
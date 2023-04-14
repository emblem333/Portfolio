class Public::HobbiesController < ApplicationController
  before_action :authenticate_user!
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
    #@hobbies = all_hobbies.page(params[:page]).per(12)
    @all_hobbies_count = all_hobbies.count
  end

  def show
    @hobby = Hobby.where_genre_active.find(params[:id])
    @genres = Genre.only_active
  end

  def create
    @hobby = Hobby.new(hobby_params)
    @hobby.save ? (redirect_to hobby_path(@hobby)) : (render :new)
  end

  def show
  end

  def edit
  end

  def update
    @hobby.update(hobby_params) ? (redirect_to hobbies_path(@hobby)) : (render :edit)
  end

  private
  def hobby_params
    params.require(:hobby).permit(:genre_id, :name, :introduction, :image, :is_active)
  end

  def ensure_hobby
    @hobby = Hobby.find(params[:id])
  end

end

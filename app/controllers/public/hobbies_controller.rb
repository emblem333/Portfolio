class Public::HobbiesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :ensure_hobby, only: [:show, :edit, :update, :destroy]

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
    @genres = Genre.only_active
    @user = current_user.id
    @hobby_comment = HobbyComment.new
  end

  def create
    @hobby = Hobby.new(hobby_params)
    @hobby.user_id = current_user.id
    @hobby.save ? (redirect_to hobby_path(@hobby)) : (render :new)
  end

  def edit
  end

  def update
    @hobby.update(hobby_params) ? (redirect_to hobbies_path(@hobby)) : (render :edit)
  end

  def destroy
    @hobby.destroy
    redirect_to hobbies_path
  end

  private
  def hobby_params
    params.require(:hobby).permit(:genre_id, :name, :introduction, :image, :is_active, :user_id)
  end

  def ensure_hobby
    @hobby = Hobby.find(params[:id])
  end

end

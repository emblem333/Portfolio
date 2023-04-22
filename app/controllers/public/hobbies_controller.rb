class Public::HobbiesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :ensure_hobby, only: [:show, :edit, :update, :destroy]

  def new
    @hobby = Hobby.new
  end

  def index
    @tags = Tag.all
    @users = User.all
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

  def show
    @genres = Genre.only_active
    @hobbies = Hobby.find(params[:id])
    #@hobby = Hobby.new
    @hobby_comment = HobbyComment.new
  end

  def create
    @hobby = Hobby.new(hobby_params)
    @hobby.user_id = current_user.id
    @hobby.save ? (redirect_to hobby_path(@hobby)) : (render :new)

    if @hobby.save
      @hobby.save_tags(params[:hobby][:tag])
    else
      render :new
    end
  end

  def edit
  end

  def update
    #@hobby.update(hobby_params) ? (redirect_to hobbies_path(@hobby)) : (render :edit)
    if @hobby.update(hobby_params)
      @hobby.save_tags(params[:hobby][:tag])
      # タグの更新
      # 成功したら投稿記事へリダイレクト
      redirect_to hobbies_path(@hobby)
    else
      # 失敗した場合は、editへ戻る
      render :edit
    end
  end

  def destroy
    if @hobby.user_id == current_user.id
      @hobby.destroy
      redirect_to hobbies_path
      flash[:notice] = "投稿を削除しました"
    else
      redirect_to hobbies_path
      flash[:alert] = "他人の投稿は削除できません"
    end
  end

  private

  def hobby_params
    params.require(:hobby).permit(:genre_id, :name, :introduction, :image, :is_active, :user_id)
  end

  def ensure_hobby
    @hobby = Hobby.find(params[:id])
  end

end

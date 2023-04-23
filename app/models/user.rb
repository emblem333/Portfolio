class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :hobbies, dependent: :destroy
        has_many :favorites, dependent: :destroy
        has_many :hobby_comments, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
      #user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end

  #def guest_check
  #  if @user.email == User.find(1)
  #    redirect_to hobbies_path, notice: "このページを見るには会員登録が必要です。"
  #  end
  #end

end

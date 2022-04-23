class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email
  end

  #新規登録時のパスワードの設定
  with_options on: :create do
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze, message:"は半角英数を両方含む必要があります"}
  end

  #アカウント編集のパスワードの設定
  with_options on: :update do
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze, message:"は半角英数を両方含む必要があります", allow_blank: true}
  end
end

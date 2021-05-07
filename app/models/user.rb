class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  # has_many :comments, dependent: :destroy

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  with_options presence: true, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }, length: { minimum: 6 },
               confirmation: true do
    validates :password
    validates :password_confirmation
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :family_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナ文字を使用してください' } do
    #  /\A[ァ-ヶー－]+\z/
    validates :first_name_kana
    validates :family_name_kana
  end

  with_options presence: true do
    validates :birth_date
    validates :nickname
  end
end

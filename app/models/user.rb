class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  with_options presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
    validates :first_name
    validates :second_name
  end

  with_options presence: true,format: { with: /[ァ-ヶ一]/} do
    validates :first_name_kana
    validates :second_name_kana
  end

  validates :birthday, presence: true
end
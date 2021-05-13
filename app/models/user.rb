class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :purchases

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  with_options presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
    validates :first_name
    validates :second_name
  end

  with_options presence: true,format: { with: /\A[ァ-ヶー－]+\z/} do
    validates :first_name_kana
    validates :second_name_kana
  end

  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'no half width digit' 
end

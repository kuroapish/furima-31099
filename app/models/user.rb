class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many:items

  validates :password, format: { with: /(?=.*?[a-z])(?=.*?\d)[a-z\d]/i, message: '半角英数字両方入れてください' }
  
  with_options presence: true do
    NAME = /\A[ぁ-んァ-ン一-龥]/.freeze
    NAME_KANA = /\A[ァ-ヶー－]+\z/.freeze

    validates :nickname
    validates :first_name, format:      { with: NAME, message: 'is invalid. Input full-width characters.' }
    validates :last_name, format:       { with: NAME, message: 'is invalid. Input full-width characters.' }
    validates :first_name_kana, format: { with: NAME_KANA, message: 'is invalid. Input full-width katakana characters.' }
    validates :last_name_kana, format:  { with: NAME_KANA, message: 'is invalid. Input full-width katakana characters.' }
    validates :birthday
  end
end

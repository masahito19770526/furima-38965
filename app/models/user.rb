class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


has_many :items
has_many :orders 

with_options presence: true do 
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, }

  validates :nickname, uniqueness: true
 
  validates :email, uniqueness: true
 
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }

  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_date
  end
end

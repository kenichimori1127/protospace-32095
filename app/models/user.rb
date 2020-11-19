class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :prototypes, dependent: :destroy
  has_many :comments,   dependent: :destroy

  validates :name,        presence: true #空の場合はDBに保存しない
  validates :profile ,    presence: true #空の場合はDBに保存しない
  validates :occupation,  presence: true #空の場合はDBに保存しない
  validates :position,    presence: true #空の場合はDBに保存しない

end

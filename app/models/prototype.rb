class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image #1対1,画像ファイルを紐付け
  has_many :comments

  validates :title,      presence: true #空の場合はDBに保存しない
  validates :catch_copy, presence: true #空の場合はDBに保存しない
  validates :concept,    presence: true #空の場合はDBに保存しない
  validates :image,      presence: true #空の場合はDBに保存しない

end

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype

   validates :text,      presence: true #空の場合はDBに保存しない
   validates :user,      presence: true #空の場合はDBに保存しない
   validates :prototype, presence: true #空の場合はDBに保存しない
end

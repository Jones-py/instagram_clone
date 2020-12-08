class User < ApplicationRecord
  mount_uploader :favpic, FavpicUploader
  has_many :chats
  before_validation{email.downcase!}
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :favorites, dependent: :destroy
  has_many :favorite_chats, through: :favorites, source: :chat
end

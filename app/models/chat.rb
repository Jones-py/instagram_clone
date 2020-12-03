class Chat < ApplicationRecord
  belongs_to :user
  validates :post, presence: true, length: {minimum:1, maximum: 300}
  mount_uploader :image, ImageUploader
end

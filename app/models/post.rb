class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, presence: true
  validates :user_id, presence: true
  validates :title, presence: true
  validates :genre, presence: true
  validates :point, presence: true
  has_many :reviews, dependent: :destroy
  belongs_to :user
  def user
    return User.find_by(id: self.user_id)
  end
  has_many :like, dependent: :destroy
end

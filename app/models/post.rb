class Post < ApplicationRecord
  validates :content, presence: true
  validates :user_id, presence: true
  validates :title, presence: true
  validates :genre, presence: true
end

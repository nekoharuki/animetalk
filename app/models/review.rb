class Review < ApplicationRecord
  validates :comment, {presence: true}
  validates :point, {presence: true}
  validates :user_id, {presence: true}
  validates :post_id, {presence: true}
  def user
    return  User.find_by(id: self.user_id)
  end
end

class Board < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 140}
  
  has_many :board_users
  has_many :users, through: :board_users

  def owner
    board_users.owner.map(&:user)
  end

  def make_owner!(user)
    board_user = board_users.find_by(user_id: user.id)
    board_user.is_owner = true
    board_user.save
  end
end

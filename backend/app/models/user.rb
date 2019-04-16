class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :email, :password_digest
  has_and_belongs_to_many :boards, -> { distinct }


  def owned_boards 
    Board.where("user_id = ?", id)
  end
end

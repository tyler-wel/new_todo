class User < ApplicationRecord
  has_secure_password
  
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
  validates :password_digest,
            length: { minimum: 6 },
            if: -> { new_record? || !password_digest.nil? }
  
  
  has_and_belongs_to_many :boards, -> { distinct }

  def owned_boards 
    Board.where("user_id = ?", id)
  end

end

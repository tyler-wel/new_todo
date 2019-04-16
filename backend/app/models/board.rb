class Board < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 140}

  has_and_belongs_to_many :users, -> { distinct }
end

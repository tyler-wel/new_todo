class TaskList < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }

  belongs_to :board
end

class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  validates :desc, length: { maximum: 100 }
  
  belongs_to :task_list
end

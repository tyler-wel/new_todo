class BoardUser < ApplicationRecord
  belongs_to :user
  belongs_to :board

  scope :owner, -> { where(:is_owner => true)}
end

module Types
  class BoardType < BaseObject
    field :id, ID
    field :board_name, String
    field :board_desc, String
    field :owner_id, ID
  end
end
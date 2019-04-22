module Types
  class ListType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :board, BoardType, null: false
    field :tasks, [TaskType], null: false
  end
end
module Types
  class BoardType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :owner, [UserType], null: false
    field :users, [UserType], null: false
    field :task_lists, [ListType], null: false
  end
end
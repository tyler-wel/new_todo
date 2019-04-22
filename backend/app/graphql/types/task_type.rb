module Types
  class TaskType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :desc, String, null: false
    field :task_list_id, ID, null: false
  end
end
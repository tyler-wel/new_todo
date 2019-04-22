module Types
  class QueryType < Types::BaseObject
    field :all_users, resolver: Queries::UserQuery
    field :user_boards, resolver: Queries::BoardQuery
    field :get_task_list, resolver: Queries::BoardListsQuery
  end
end

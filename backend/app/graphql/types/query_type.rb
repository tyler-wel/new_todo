module Types
  class QueryType < Types::BaseObject
    field :all_users, resolver: Queries::UserQuery
  end
end

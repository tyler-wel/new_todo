module Queries
  class BaseQuery < GraphQL::Schema::Resolver
    null false
    
    def current_user
      context[:current_user]
    end
  end
end
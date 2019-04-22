module Queries
  class UserQuery < BaseQuery
    
    # Custom GraphQL name OPTIONAL
    #graphql_name 'description'

    # Custom GraphQL desciprtion OPTIONAL
    #description 'description'
    
    # Arguments to resolver

    # Return type of the function
    type [Types::UserType], null: false


    def resolve()
      User.all
    end
  end
end
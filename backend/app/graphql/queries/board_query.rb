module Queries
  class BoardQuery < BaseQuery
    
    # Custom GraphQL name OPTIONAL
    #graphql_name 'description'

    # Custom GraphQL desciprtion OPTIONAL
    #description 'description'
    
    # Arguments to resolver

    # Return type of the function
    type [Types::BoardType], null: false


    def resolve()

      if current_user
        current_user.boards
      else
        puts "User is not logged in"
      end
    end
  end
end
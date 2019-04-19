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
      puts "LOGGED IN USER " + current_user.username
      if current_user
        User.all
      else
        puts "user is not logged in"
      end
    end
  end
end
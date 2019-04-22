module Queries
  class BoardListsQuery < BaseQuery
    
    # Custom GraphQL name OPTIONAL
    #graphql_name 'description'

    # Custom GraphQL desciprtion OPTIONAL
    #description 'description'
    
    # Arguments to resolver
    argument :id, ID, required: true

    # Return type of the function
    type [Types::ListType], null: false


    def resolve(id: nil)
      puts "CHECK"
      puts current_user
      if current_user
        board = Board.find(id)
        board.task_lists
      else
        puts "User is not logged in"
      end
    end
  end
end
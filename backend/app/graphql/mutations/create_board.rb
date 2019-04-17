module Mutations
  class CreateBoard < BaseMutation
    # arguments passed to the `resolved` method
    argument :name, String, required: true
    argument :description, String, required: true
    argument :user_id, ID, required: true

    # return type from the mutation
    type Types::BoardType
    
    def resolve(name: nil, description: nil, user_id: nil)
      Board.create!(
        name: name,
        description: description,
        user_id: user_id,
      )
    end
  end
end
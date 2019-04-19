module Mutations
  class CreateUser < BaseMutation
    
    # arguments passed to the 'resolved' method
    argument :username,   String, required: true
    argument :auth, Types::UserAuthInput, required: false

    # return type from the mutation
    type Types::UserType

    def resolve(username: nil, auth: nil)
      User.create!(
        username: username,
        email: auth.email,
        password: auth.password
      )
    end

  end
end
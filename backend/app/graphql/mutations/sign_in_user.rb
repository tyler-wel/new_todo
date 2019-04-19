module Mutations
  class SignInUser < BaseMutation
    null true

    # Arguments to resolver
    argument :auth, Types::UserAuthInput, required: false
    
    # Return type of the function
    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(auth: nil)
      # basic validation
      return unless auth
      user = User.find_by_email(auth[:email])

      # ensures we have the correct user
      if user&.authenticate(auth[:password])
        token = JsonWebToken.encode(user_id: user.id)
        time = Time.now + 24.hours.to_i
        { user: user, token: token }      
      end

    end
  end
end
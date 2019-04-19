module Types
  class UserAuthInput < BaseInputObject
    # the name is usually inferred by class name but can be overwritten
    graphql_name 'Auth_Input'

    argument :email, String, required: true
    argument :password, String, required: true
  end
end
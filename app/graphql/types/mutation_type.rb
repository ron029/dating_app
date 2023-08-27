module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_user, mutation: Mutations::User::CreateUser
  end
end

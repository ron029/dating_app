module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_dislike, mutation: Mutations::Dislike::Create
    field :create_like, mutation: Mutations::Like::Create
    field :create_user, mutation: Mutations::User::Create
    field :update_user, mutation: Mutations::User::Update
    field :delete_user, mutation: Mutations::User::Delete
    field :email_exists, mutation: Mutations::User::CheckEmail
    field :login, mutation: Mutations::Session::Login
  end
end

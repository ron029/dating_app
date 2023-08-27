module Types
  module Models
    class LikeType < Types::BaseObject
      field :id, ID, null: false
      field :liking_user, Types::Models::UserType, null: false
      field :liked_user, Types::Models::UserType, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end

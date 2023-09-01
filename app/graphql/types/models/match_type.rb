module Types
  module Models
    class MatchType < Types::BaseObject
      field :id, ID, null: false
      field :user1, UserType, null: true
      field :user2, UserType, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

      def user1
        user1 = object.user1
        User.find_by(id: user1)
      end

      def user2
        user2 = object.user2
        User.find_by(id: user2)
      end
    end
  end
end

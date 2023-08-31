module Types
  module Models
    class LikeType < Types::BaseObject
      field :id, ID, null: false
      field :liker, UserType, null: false
      field :liked_user, UserType, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :match, Boolean, null: true, resolver: Resolvers::LikeResolver::Match

      def liker
        User.find_by(id: object.liking_user_id)
      end

      def liked_user
        User.find_by(id: object.liked_user_id)
      end
    end
  end
end

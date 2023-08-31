module Resolvers
  module LikeResolver
    class Match < Base
      type GraphQL::Types::Boolean, null: true

      def resolve
        like = ::User.find(object.liked_user_id)

        mutual_like = like.likes_given.find_by(liked_user_id: object.liking_user_id)

        !mutual_like.nil?
      end
    end
  end
end

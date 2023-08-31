module Mutations
  module Like
    class Create < Mutations::AuthorisedMutation
      graphql_name 'CreateLike'

      argument :liked_user_id, ID, required: true

      field :errors, [String], null: true
      field :like, Types::Models::LikeType, null: true

      def resolve(params)
        like = Likes::Persistence.new(params[:liked_user_id], current_user).create
        {
          errors: like.errors.full_messages,
          like: like
        }
      end
    end
  end
end

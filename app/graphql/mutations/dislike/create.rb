module Mutations
  module Dislike
    class Create < Mutations::AuthorisedMutation
      graphql_name 'CreateDislike'

      argument :disliked_user_id, ID, required: true

      field :errors, [String], null: true
      field :dislike, Types::Models::DislikeType, null: true

      def resolve(params)
        dislike = Dislikes::Persistence.new(current_user).create(params)
        {
          errors: dislike.errors.full_messages,
          dislike: dislike
        }
      end
    end
  end
end

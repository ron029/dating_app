module Types
  module Models
    class DislikeType < Types::BaseObject
      field :id, ID, null: false
      field :disliked_user, UserType, null: true
      field :disliking_user, UserType, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

      def disliked_user
        disliked_user_id = object.disliked_user_id # Assuming you have a user association on the Dislike model
        User.find_by(id: disliked_user_id)
      end

      def disliking_user
        User.find_by(id: current_user.id)
      end
    end
  end
end

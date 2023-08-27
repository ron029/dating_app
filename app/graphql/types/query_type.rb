module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :user, Types::Models::UserType, null: false do
      description 'Get specific user'
      argument :user_id, ID, required: true
    end

    field :users, [Types::Models::UserType], null: false do
      description 'List of Users registered in the app'
    end

    field :user_likes_count, Integer, null: false do
      description 'Count of likes given by a specific user'
      argument :user_id, ID, required: true
    end

    field :user_likes, [Types::Models::LikeType], null: false do
      description 'Retrieve all likes given by a specific user'
      argument :user_id, ID, required: true
    end

    def user(user_id:)
      User.find(user_id)
    end

    def users
      User.where(admin: 0)
    end

    def user_likes_count(user_id:)
      Like.where(liking_user_id: user_id).count
    end

    def user_likes(user_id:)
      Like.where(liking_user_id: user_id)
    end

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end

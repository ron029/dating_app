module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :swipe_with_gender_interest, resolver: Queries::SwipeGenderInterest
    field :user, resolver: Queries::FetchUser
    field :users, resolver: Queries::Users
    field :likes, resolver: Queries::Likes
    field :like_given_count, resolver: Queries::LikeGivenCount
    field :like_receive_count, resolver: Queries::LikeReceiveCount
    field :dislikes, resolver: Queries::Dislikes
    field :dislike_given_count, resolver: Queries::DislikeGivenCount
    field :dislike_receive_count, resolver: Queries::DislikeReceiveCount
    field :matches, resolver: Queries::Matches
    field :matches_user, resolver: Queries::MatchesUser
    field :logout, resolver: Queries::Logout
    # TODO: remove me
    field :test_field, String, null: false, description: 'An example field added by the generator'
    def test_field
      'Hello World!'
    end
  end
end

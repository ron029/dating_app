module Queries
  class Likes < AuthorisedQueries
    type [Types::Models::LikeType], null: false
    argument :id, ID, required: false

    def resolve(id:)
      user = id.nil? ? User.find(current_user.id) : User.find(id)
      user.likes_given
    end
  end
end

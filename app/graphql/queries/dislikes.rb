module Queries
  class Dislikes < AuthorisedQueries
    type [Types::Models::DislikeType], null: false
    argument :id, ID, required: false

    def resolve(id:)
      user = id.nil? ? User.find(current_user.id) : User.find(id)
      user.dislikes_given
    end
  end
end

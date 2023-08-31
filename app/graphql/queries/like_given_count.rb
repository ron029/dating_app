module Queries
  class LikeGivenCount < AuthorisedQueries
    type Integer, null: false
    argument :id, ID, required: false

    def resolve(id: nil)
      user = id.nil? ? User.find(current_user.id) : User.find(id)
      user.likes_given.count
    end
  end
end

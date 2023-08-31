module Queries
  class FetchUser < AuthorisedQueries
    type Types::Models::UserType, null: false
    argument :id, ID, required: false

    def resolve(id: nil)
      id.nil? ? User.find(current_user.id) : User.find(id)
    end
  end
end

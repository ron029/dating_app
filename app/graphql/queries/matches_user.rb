module Queries
  class MatchesUser < AuthorisedQueries
    type [Types::Models::MatchType], null: false

    def resolve
      user = User.find_by(id: current_user.id)
      user.all_matches
    end
  end
end

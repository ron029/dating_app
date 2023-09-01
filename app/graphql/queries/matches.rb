module Queries
  class Matches < AdminQueries
    type [Types::Models::MatchType], null: false

    argument :id, ID, required: false

    def resolve(id: nil)
      if id.nil?
        Match.all
      else
        user = User.find_by(id: id)
        user.all_matches
      end
    end
  end
end

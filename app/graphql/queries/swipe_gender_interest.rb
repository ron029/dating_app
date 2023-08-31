module Queries
  class SwipeGenderInterest < AuthorisedQueries
    type [Types::Models::UserType], null: false

    def resolve
      User.where(admin: 0, gender: current_user.gender_interest).where.not(id: current_user.id)
    end
  end
end

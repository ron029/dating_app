module Queries
  class Users < AdminQueries
    type [Types::Models::UserType], null: false

    def resolve
      User.where(admin: 0).where.not(id: current_user.id)
    end
  end
end

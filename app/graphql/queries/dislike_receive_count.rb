module Queries
  class DislikeReceiveCount < AuthorisedQueries
    type Integer, null: false
    argument :id, ID, required: false

    def resolve(id: nil)
      user = id.nil? ? User.find(current_user.id) : User.find(id)
      user.dislikes_received.count
    end
  end
end

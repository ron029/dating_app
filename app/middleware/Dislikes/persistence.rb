module Dislikes
  class Persistence
    attr_reader :current_user

    def initialize(current_user = nil)
      @current_user = current_user
    end

    def create(params)
      return current_user if current_user.nil?

      Dislike.create(
        disliking_user_id: current_user.id,
        disliked_user_id: params[:disliked_user_id]
      )
    end
  end
end

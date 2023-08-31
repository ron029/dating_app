module Likes
  class Persistence
    attr_reader :current_user, :liked_user_id, :like

    def initialize(liked_user_id, current_user = nil)
      @current_user = current_user
      @liked_user_id = liked_user_id
    end

    def create
      return nil if current_user.nil?

      return unless other_user_exists?

      like = Like.create(
        liking_user_id: current_user.id,
        liked_user_id: liked_user_id.to_i
      )
      create_match if check_for_match?
      like
    end

    private

    def check_for_match?
      like = User.find(liked_user_id)
      mutual_like = like.likes_given.find_by(liked_user_id: current_user.id)
      !mutual_like.nil?
    end

    def create_match
      params = { user1_id: current_user.id, user2_id: liked_user_id }
      Match.create(params) unless mutual_match?(current_user.id, liked_user_id)
    end

    def mutual_match?(user1, user2)
      Match.exists?(
        user1_id: user1,
        user2_id: user2
      ) || Match.exists?(
        user1_id: user2,
        user2_id: user1
      )
    end

    def other_user_exists?
      User.find(liked_user_id)
    rescue ActiveRecord::RecordNotFound
      raise GraphQL::ExecutionError.new('User to be liked not found')
    end
  end
end

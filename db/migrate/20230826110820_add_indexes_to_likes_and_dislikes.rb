class AddIndexesToLikesAndDislikes < ActiveRecord::Migration[6.1]
  def change
    add_index :likes, :liking_user_id
    add_index :likes, :liked_user_id
    add_index :dislikes, :disliking_user_id
    add_index :dislikes, :disliked_user_id
  end
end

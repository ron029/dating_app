class AddForeignKeysToLikesAndDislikes < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :likes, :users, column: :liking_user_id
    add_foreign_key :likes, :users, column: :liked_user_id

    add_foreign_key :dislikes, :users, column: :disliking_user_id
    add_foreign_key :dislikes, :users, column: :disliked_user_id
  end
end

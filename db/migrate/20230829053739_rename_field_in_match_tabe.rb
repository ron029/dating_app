class RenameFieldInMatchTabe < ActiveRecord::Migration[6.1]
  def change
    rename_column :matches, :liking_user_id, :user1_id
    rename_column :matches, :liked_user_id, :user2_id
  end
end

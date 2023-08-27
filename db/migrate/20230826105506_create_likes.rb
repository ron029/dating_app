class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :liking_user_id
      t.integer :liked_user_id

      t.timestamps
    end
  end
end

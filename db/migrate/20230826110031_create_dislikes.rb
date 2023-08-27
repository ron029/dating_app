class CreateDislikes < ActiveRecord::Migration[6.1]
  def change
    create_table :dislikes do |t|
      t.integer :disliking_user_id
      t.integer :disliked_user_id

      t.timestamps
    end
  end
end

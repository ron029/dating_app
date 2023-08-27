class AddIndexToUsersGender < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :gender
  end
end

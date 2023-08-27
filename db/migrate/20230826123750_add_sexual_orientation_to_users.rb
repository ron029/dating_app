class AddSexualOrientationToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :sexual_orientation, :string
  end
end

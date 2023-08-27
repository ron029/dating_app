class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.references :liking_user, foreign_key: { to_table: :users }
      t.references :liked_user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

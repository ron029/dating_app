class AddColumnGenderInterestToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :gender_interest, :string
  end
end

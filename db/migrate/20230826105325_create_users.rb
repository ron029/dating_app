class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.string :email
      t.date :birthdate
      t.string :gender
      t.string :country
      t.string :state_region
      t.string :city
      t.string :school
      t.text :bio
      t.integer :admin
      t.string :password_digest

      t.timestamps
    end
  end
end

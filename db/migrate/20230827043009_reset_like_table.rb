class ResetLikeTable < ActiveRecord::Migration[6.1]
  def change

     # Delete all data from the likes table
     Like.delete_all

     # Reset the primary key sequence (if your database supports it)
     if ActiveRecord::Base.connection.adapter_name.downcase.start_with?('postgresql')
       reset_pk_sequence!('likes')
     end
  end
end

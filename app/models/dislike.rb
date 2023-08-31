class Dislike < ApplicationRecord
  belongs_to :disliker, class_name: 'User', foreign_key: 'disliking_user_id'
  belongs_to :disliked_user, class_name: 'User', foreign_key: 'disliked_user_id'

  validates_uniqueness_of :disliking_user_id, scope: :disliked_user_id
  validates_uniqueness_of :disliked_user_id, scope: :disliking_user_id
end

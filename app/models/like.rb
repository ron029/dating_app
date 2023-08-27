class Like < ApplicationRecord
  belongs_to :liker, class_name: 'User', foreign_key: 'liking_user_id'
  belongs_to :liked_user, class_name: 'User', foreign_key: 'liked_user_id'

  validates_uniqueness_of :liking_user_id, scope: :liked_user_id
  validates_uniqueness_of :liked_user_id, scope: :liking_user_id
end

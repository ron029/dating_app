class Match < ApplicationRecord
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'

  validates :user1_id, uniqueness: { scope: :user2_id, message: 'Match already exists' }
  validates :user2_id, uniqueness: { scope: :user1_id, message: 'Match already exists' }
end

# belongs_to :liking_user, class_name: 'User', foreign_key: 'liking_user_id'
# belongs_to :liked_user, class_name: 'User', foreign_key: 'liked_user_id'

# validates_uniqueness_of :liking_user_id, scope: :liked_user_id

class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_save :update_admin

  has_many :likes_given, class_name: 'Like', foreign_key: 'liking_user_id', dependent: :destroy
  has_many :likes_received, class_name: 'Like', foreign_key: 'liked_user_id', dependent: :destroy
  has_many :dislikes_given, class_name: 'Dislike', foreign_key: 'disliking_user_id', dependent: :destroy
  has_many :dislikes_received, class_name: 'Dislike', foreign_key: 'disliked_user_id', dependent: :destroy

  regex_email = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  VALID_EMAIL_REGEX = regex_email.freeze

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :mobile_number, presence: true
  validates :password, presence: true, length: { minimum: 6, maximum: 50 }, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates_date :birthdate
  validate :validate_gender
  validate :validate_sexual_orientation
  validates :country, :state_region, :city, presence: true, length: { maximum: 100 }
  validates :school, length: { maximum: 100 }
  validates :bio, length: { maximum: 255 }

  has_secure_password

  private

  def update_admin
    self.admin = User.count.zero? ? 1 : 0
  end

  def validate_gender
    unless ['male', 'female'].include?(gender)
      errors.add(:gender, 'must be either "male" or "female"')
    end
  end

  def validate_sexual_orientation
    unless ['male', 'female'].include?(sexual_orientation)
      errors.add(:sexual_orientation, 'must be either "male" or "female"')
    end
  end
end

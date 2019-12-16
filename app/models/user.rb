class User < ApplicationRecord
  belongs_to :city
  has_many :profiles, dependent: :destroy, inverse_of: :user
  accepts_nested_attributes_for :profiles, allow_destroy: true, reject_if: :all_blank

  before_save {email.downcase!}
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end

class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profiles
  validates :address, presence: true, length: {maximum: 255}
end

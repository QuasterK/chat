
class User < ApplicationRecord
  has_secure_password
  validates :email, :nick, presence: true
  validates :email, uniqueness: true
end

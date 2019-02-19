class Message < ApplicationRecord
  validates :data, presence: true
  belongs_to :user
end

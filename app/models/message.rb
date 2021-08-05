class Message < ApplicationRecord
  validates :content, length: {maximum: 140}, presence: true
  belongs_to :user
  belongs_to :room
end

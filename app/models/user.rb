class User < ApplicationRecord
  belongs_to :character
  belongs_to :location
  belongs_to :episode
  belongs_to :show

  validates :username, presence: true
end

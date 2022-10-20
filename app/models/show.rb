class Show < ApplicationRecord
  has_many :characters
  has_many :locations
  has_many :episodes
  has_many :user

  validates :name, presence: true
end

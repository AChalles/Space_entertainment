class Location < ApplicationRecord
  belongs_to :show
  has_many :user

  validates :name, :dimension, presence: true
end

class Character < ApplicationRecord
  belongs_to :show
  has_many :user

  validates :name, :birth_place, presence: true
end

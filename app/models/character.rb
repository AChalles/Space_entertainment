class Character < ApplicationRecord
  belongs_to :show
  has_many :user

  validates :name, presence: true
end

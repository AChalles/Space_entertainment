class Episode < ApplicationRecord
  belongs_to :show
  has_many :user

  validates :name, :air_date, :episode_number,  presence: true
end

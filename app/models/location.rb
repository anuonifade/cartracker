class Location < ApplicationRecord
  belongs_to :car

  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :car, presence: true
end

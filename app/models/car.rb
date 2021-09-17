class Car < ApplicationRecord
  has_many :locations, dependent: :destroy

  validates :name, presence: true
  validates :car_type, presence: true
  validates :car_model, presence: true
end

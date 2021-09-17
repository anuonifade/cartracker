# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    longitude { Faker::Number.decimal(l_digits: 5, r_digits: 3) }
    latitude { Faker::Number.decimal(l_digits: 5, r_digits: 3) }
    car
  end
end

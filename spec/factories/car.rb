# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    name { Faker::Vehicle.make }
    car_type { Faker::Vehicle.car_type }
    car_model { Faker::Vehicle.make_and_model }

    factory :car_with_locations do
      transient do
        location_count { 5 }
      end

      after(:create) do |car, evaluator|
        create_list(:location, evaluator.location_count, car: car)

        car.reload
      end
    end
  end
end

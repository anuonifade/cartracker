# frozen_string_literal: true

module Api
  module V1
    class CarsController < ApplicationController
      skip_before_action :verify_authenticity_token
      include ExceptionHandler
      before_action :set_car, only: %i[show update destroy]

      def index
        render json: Car.all, status: :ok
      end

      def create
        car = Car.create!(car_param)

        render json: car, status: :created
      end

      def show
        render json: @car.to_json(include: :locations), status: :ok
      end

      def update
        @car.update!(car_param)
        head :no_content
      end

      def destroy
        @car.destroy
        head :no_content
      end

      private

      def car_param
        params.permit(:name, :car_type, :car_model)
      end

      def set_car
        @car = Car.find(params[:id])
      end
    end
  end
end

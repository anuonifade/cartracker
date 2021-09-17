# frozen_string_literal: true

module Api
  module V1
    class LocationsController < ApplicationController
      skip_before_action :verify_authenticity_token
      include ExceptionHandler
      before_action :set_car
      before_action :set_location, only: :destroy

      def index
        render json: @car.locations.all, status: :ok
      end

      def create
        location = @car.locations.create!(location_param)

        render json: location, status: :created
      end

      def show
        render json: @car.locations.find(params[:id]), status: :ok
      end

      def destroy
        @location.destroy
        head :no_content
      end

      private

      def set_car
        @car = Car.find(params[:car_id])
      end

      def set_location
        @location = Location.find(params[:id])
      end

      def location_param
        params.permit(:longitude, :latitude)
      end
    end
  end
end

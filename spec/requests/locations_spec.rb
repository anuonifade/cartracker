# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Location API' do
  let!(:car) { create(:car_with_locations, location_count: 10) }
  let(:car_id) { car.id }
  let(:id) { car.locations.first.id }

  describe 'GET API /cars/:car_id/locations' do
    before { get "/api/v1/cars/#{car_id}/locations" }

    context 'when location exist' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all car locations' do
        expect(json.size).to eq(10)
      end
    end

    context 'when car does not exist' do
      let(:car_id) { 0 }

      it 'returns a status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Car with 'id'=0/)
      end
    end
  end

  describe 'GET API /cars/:car_id/locations/:id' do
    before { get "/api/v1/cars/#{car_id}/locations/#{id}" }

    context 'when car location exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the location' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when the car location does not exist' do
      let(:id) { 0 }

      it 'returns a status code of 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found error message' do
        expect(response.body).to match(/Couldn't find Location with 'id'=0/)
      end
    end
  end

  describe 'POST /cars/:car_id/locations' do
    let(:valid_attributes) { { latitude: 43_443.988, longitude: 12_233.223 } }
    let(:invalid_attributes) { { longitude: 12_233.223 } }

    context 'when the request is valid' do
      before { post "/api/v1/cars/#{car_id}/locations", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when requests are not valid' do
      before do
        post "/api/v1/cars/#{car_id}/locations", params: invalid_attributes
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Latitude can't be blank/)
      end
    end
  end

  describe 'DELETE /cars/:car_id/locations/:id' do
    before { delete "/api/v1/cars/#{car_id}/locations/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

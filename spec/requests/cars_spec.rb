# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Car API' do
  let!(:car) { create_list(:car, 10) }
  let(:car_id) { car.first.id }

  # Test suite for GET /api/v1/cars
  describe 'GET API /cars' do
    before { get '/api/v1/cars' }

    it 'returns car' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /api/v1/cars/:id
  describe 'GET API /cars/:id' do
    before { get "/api/v1/cars/#{car_id}" }

    context 'when the record exists' do
      it 'returns the car' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(car_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:car_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Car/)
      end
    end
  end

  # Test suite for POST api/v1/cars
  describe 'POST API /cars' do
    # valid payload
    let(:valid_attributes) do
      {
        name: 'Test',
        car_type: 'Test type',
        car_model: 'Test model'
      }
    end

    context 'when the request is valid' do
      before { post '/api/v1/cars', params: valid_attributes }

      it 'creates a car' do
        expect(json['name']).to eq('Test')
        expect(json['car_type']).to eq('Test type')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/cars', params: { name: 'Another name' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Car type can't be blank, Car model can't be blank/)
      end
    end
  end

  # Test suite for PUT /api/v1/car
  describe 'PUT API /cars/:id' do
    let(:valid_attributes) { { name: 'UpdatedCarName' } }

    context 'when the record exists' do
      before { put "/api/v1/cars/#{car_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /api/v1/car/:id
  describe 'DELETE API /cars/:id' do
    before { delete "/api/v1/cars/#{car_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

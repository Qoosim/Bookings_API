require 'rails_helper'

RSpec.describe "Bikes", type: :request do
    # initialize test data
    # Add bike owner
    let(:user) { create(:user) }
    let!(:bikes) { create_list(:bike, 5) }
    let(:bike_id) { bikes.first.id }
    # Authorize request
    let(:headers) { valid_headers }
  
    # Test suite for GET /bikes
    describe 'GET /v1/bikes' do
      # make HTTP get request before each example
      before { get '/v1/bikes', params: {}, headers: headers }
  
      it 'returns bikes' do
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect(json.size).to eq(5)
      end
  
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  
    # Test suite for GET /bikes/:id
    describe 'GET /v1/bikes/:id' do
      before { get "/v1/bikes/#{bike_id}", params: {}, headers: headers }
  
      context 'when the record exists' do
        it 'returns the user' do
          expect(json).not_to be_empty
          expect(json['id']).to eq(bike_id)
        end
  
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end
  
      context 'when the record does not exist' do
        let(:bike_id) { 100 }
  
        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
  
        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Bike/)
        end
      end
    end
  
    # Test suite for POST /bikes
    describe 'POST /v1/bikes' do
      # valid payload
      # send json payload
      let(:valid_attributes) { { model: 'Classic 350', color: 'red', price: '$700000',
                                 weight: '192kg', engine_capacity: '346.0 CC' }.to_json }
  
      context 'when the request is valid' do
        before { post '/v1/bikes', params: valid_attributes, headers: headers }
  
        it 'creates a bike' do
          expect(json['model']).to eq('Classic 350')
        end
  
        it 'returns status code 201' do
          expect(response).to have_http_status(201)
        end
      end
  
      context 'when the request is invalid' do
        let(:invalid_attributes) { { model: nil }.to_json }
        before { post '/v1/bikes', params: invalid_attributes, headers: headers }
  
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
  
        it 'returns a validation failure message' do
          expect(json['message']).to match(/Validation failed: Model can't be blank/)
        end
      end
    end
  
    # Test suite for PUT /bikes/:id
    describe 'PUT /v1/bikes/:id' do
      let(:valid_attributes) { { model: 'Classic 350' }.to_json }
  
      context 'when the record exists' do
        before { put "/v1/bikes/#{bike_id}", params: valid_attributes, headers: headers }
  
        it 'updates the record' do
          expect(response.body).to be_empty
        end
  
        it 'returns status code 204' do
          expect(response).to have_http_status(204)
        end
      end
    end
  
    # Test suite for DELETE /bikes/:id
    describe 'DELETE /v1/bikes/:id' do
      before { delete "/v1/bikes/#{bike_id}", params: {}, headers: headers }
  
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
end

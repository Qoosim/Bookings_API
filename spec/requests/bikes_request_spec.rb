require 'rails_helper'

RSpec.describe "Bikes", type: :request do
    # initialize test data 
    let!(:bikes) { create_list(:bike, 10) }
    let(:bike_id) { bikes.first.id }
  
    # Test suite for GET /bikes
    describe 'GET /bikess' do
      # make HTTP get request before each example
      before { get '/bikes' }
  
      it 'returns bikes' do
        # Note `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect(json.size).to eq(10)
      end
  
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  
    # Test suite for GET /bikes/:id
    describe 'GET /bikes/:id' do
      before { get "/bikes/#{bike_id}" }
  
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
    describe 'POST /bikes' do
      # valid payload
      let(:valid_attributes) { { model: 'Royal Enfield Classic 350', color: 'red', price: '$700000',
                                 weight: '192kg', engine_capacity: '346.0 CC' } }
  
      context 'when the request is valid' do
        before { post '/bikes', params: valid_attributes }
  
        it 'creates a bike' do
          expect(json['model']).to eq('Royal Enfield Classic 350')
        end
  
        it 'returns status code 201' do
          expect(response).to have_http_status(201)
        end
      end
  
      context 'when the request is invalid' do
        before { post '/bikes', params: { model: 'Yamaha' } }
  
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
  
        it 'returns a validation failure message' do
          expect(response.body)
            .to match(/Validation failed: Color can't be blank, Price can't be blank, Weight can't be blank, Engine capacity can't be blank/)
        end
      end
    end
  
    # Test suite for PUT /bikes/:id
    describe 'PUT /bikes/:id' do
      let(:valid_attributes) { { model: 'Royal Enfield Classic 350' } }
  
      context 'when the record exists' do
        before { put "/bikes/#{bike_id}", params: valid_attributes }
  
        it 'updates the record' do
          expect(response.body).to be_empty
        end
  
        it 'returns status code 204' do
          expect(response).to have_http_status(204)
        end
      end
    end
  
    # Test suite for DELETE /bikes/:id
    describe 'DELETE /bikes/:id' do
      before { delete "/bikes/#{bike_id}" }
  
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
end

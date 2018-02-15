require 'rails_helper'

RSpec.describe 'Trips API', type: :request do
  
  let!(:trips) { create_list(:trip, 10) }
  let(:trip_id) { trips.first.id }

  describe 'GET /trips' do
    before { get '/trips' }

    it 'returns trips' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test GET /trips/:id
  describe 'GET /trips/:id' do
      
    before { get "/trips/#{trip_id}" }

    context 'when record exists' do
      it 'returns the trip and status code success' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(trip_id)
        expect(response).to have_http_status(200)
      end
    end

    context 'when record doesnt exist' do
        
      let(:trip_id) { 100 }

      it 'returns code 404 and not found message' do
        expect(response).to have_http_status(404)
        expect(response.body).to match(/Couldn't find Trip/)
      end

    end

  end

  # Test POST /trips
  describe 'POST /trips' do
    let(:valid_attributes) { { start_latlng: [12.21312, 15.99229] } }

    context 'when the request is valid' do
      
      before { post '/trips', params: valid_attributes }

      it 'creates a trip and returns 201 status code' do
        expect(json['start_latlng']).to eq([12.21312, 15.99229])
        expect(response).to have_http_status(201)
      end

    end

    context 'when request is invalid' do
      before { post '/trips', params: { start_latlng: [] } }

      it 'returns status code 422 and validation failure message' do
        expect(response.body).to match(/Validation failed/)
        expect(response).to have_http_status(422)
      end
    end

  end

  # Test PUT /trips/:id
  describe 'PUT /trips/:id' do
    let(:valid_attributes) { { start_latlng: [ 12.22, 13.22 ] } }
    context 'when record exists' do
      before { put "/trips/#{trip_id}", params: valid_attributes }
      it 'updates the record and have status code 204' do
        expect(response.body).to be_empty
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test DELETE /trips/:id
  describe 'DELETE /trips/:id' do
    before { delete "/trips/#{trip_id}" }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end

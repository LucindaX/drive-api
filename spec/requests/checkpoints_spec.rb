require 'rails_helper'

RSpec.describe 'Checkpoints API' do

  let!(:trip) { create(:trip, :ongoing) }
  let!(:completed_trip) { create(:trip, :completed) }
  let!(:checkpoints) { create_list(:checkpoint, 20, trip_id: trip.id) }
  let(:trip_id) { trip.id }
  let(:id) { checkpoints.first.id }

  # Test GET /trips/:trip_id/checkpoints
  describe 'GET /trips/:trip_id/checkpoints' do
    
    before { get "/trips/#{trip_id}/checkpoints" }

    context 'when trip exists' do

      it 'returns all checkpoints and status code 200' do
        expect(json.size).to eq(20)
        expect(response).to have_http_status(200)
      end

    end

    context 'when trip doesnt exist' do
      
      let(:trip_id) { 100 }
      it 'returns status code 404 and not found message' do
        expect(response).to have_http_status(404)
        expect(response.body).to match(/Couldn't find Trip/)
      end
    
    end

  end

  # Test GET /trips/:trip_id/checkpoints/:id
  describe 'GET /trips/:trip_id/checkpoints/:id' do
    before { get "/trips/#{trip_id}/checkpoints/#{id}" }

    context 'when trip checkpoint exists' do
      it 'returns checkpoint and status code 200' do
        expect(response).to have_http_status(200)
        expect(json['id']).to eq(id)
      end
    end

    context 'when trip checkpoint doesnt exist' do
      let(:id) { 100 }
      it 'returns status 404 and not found message' do
        expect(response.body).to match(/Couldn't find Checkpoint/)
        expect(response).to have_http_status(404)
      end
    end

  end

  # Test POST /trips/:trip_id/checkpoints
  describe 'POST /trips/:trip_id/checkpoints' do
    let(:valid_attributes) { { latlng: [12.22,12.22] } }

    context 'when request atrributes are valid' do
      before { post "/trips/#{trip_id}/checkpoints", params: valid_attributes }
      it 'returns trip and status code 201' do
        expect(json['id']).to eq(trip_id)
        expect(response).to have_http_status(201)
      end
    end

    context 'when request attributes are invalid' do
      before { post "/trips/#{trip_id}/checkpoints", params: {} }
      it 'returns invalid message and 422 status code' do
        expect(response.body).to match(/Validation failed/)
        expect(response).to have_http_status(422)
      end
    end

    context 'when trip is already completed' do
      before { post "/trips/#{completed_trip.id}/checkpoints", params: valid_attributes }
      it 'returns trip completed message and 422 status code' do
        expect(response).to have_http_status(422)
        expect(response.body).to match(/Trip completed/)
      end
    end

  end

  # Test PUT /trips/:trip_id/checkpoints/:id
  describe 'PUT /trips/:trip_id/checkpoints/:id' do
    
    let(:valid_attributes) { { latlng: [22.22,22.22] } }
    
    before { put "/trips/#{trip_id}/checkpoints/#{id}", params: valid_attributes }
    
    context 'when checkpoint exists' do
      it 'returns checkpoint and status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when checkpoint doesnt exist' do
      let(:id) { 100 }
      it 'returns not found message and status code 404' do
        expect(response).to have_http_status(404)
        expect(response.body).to match(/Couldn't find Checkpoint/)
      end
    end

  end

  # Test DELETE /trips/:trip_id/checkpoints/:id
  describe 'DELETE /trips/:trip_id/checkpoints/:id' do
    before { delete "/trips/#{trip_id}/checkpoints/#{id}" }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end

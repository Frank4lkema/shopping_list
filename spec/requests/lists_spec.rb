# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Lists', type: :request do
  let!(:lists) { create_list(:list, 10) }
  let(:list_id) { lists.first.id }

  # Test suite for GET /lists
  describe 'GET /lists' do
    before { get '/lists' }

    it 'returns lists' do
      get lists_path
      expect(response).to be_successful
      expect(assigns(:lists)).to include(*List.all.order(:date))
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /lists/:id
  describe 'GET /lists/:id' do
    context 'when the record exists' do
      before { get "/lists/#{list_id}" }
      it 'returns the list' do
        expect(assigns(:list)).not_to be_nil
        expect(assigns(:list).id).to eq(list_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:list_id) { 100 }

      it ' to raise not found error' do
        expect { get "/lists/#{list_id}" }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end
end

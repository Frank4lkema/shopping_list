# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'List products API', type: :request do
  let(:list) { create(:list) }
  let(:product) { create(:product) }
  let!(:product_list) { create(:list_product, list: list, product: product, amount: 1) }

  # Test suite for GET /list_products/:id
  describe 'GET /lists/:id/products' do
    context 'when the list exists' do
      before { get "/lists/#{list.id}/products" }
      it 'returns the list of products' do
        expect(json).not_to be_empty
        expect(json.size).to eq(1)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:list_id) { 100 }
      before { get "/lists/#{list_id}/products" }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find List/)
      end
    end
  end

  describe 'POST /lists/:id/products' do
    let(:new_product) { create(:product) }
    context 'when request has valid params' do
      let(:valid_params) { { amount: 1, product_id: new_product.id } }
      before { post "/lists/#{list.id}/products", params: valid_params }
      it 'expected to create a new list-product' do
        expect(json['amount']).to eq(1)
      end

      it 'expect to have code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request has invalid params' do
      let(:invalid_params) { { amount: 0, product_id: new_product.id } }
      before { post "/lists/#{list.id}/products", params: invalid_params }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Amount must be greater than 0/)
      end
    end
  end
end

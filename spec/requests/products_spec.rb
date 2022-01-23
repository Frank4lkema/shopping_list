# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products API', type: :request do
  let!(:products) { create_list(:product, 10) }
  let(:product_id) { products.first.id }

  describe 'POST /products' do
    let(:valid_params) { { name: 'Melk', standard: true } }

    context 'when request has valid params' do
      before { post '/products', params: valid_params }
      it 'expected to create a new product' do
        expect(assigns(:product).name).to eq('Melk')
        expect(assigns(:product).standard?).to eq(true)
      end
    end

    context 'when request has invalid params' do
      let(:invalid_params) { { name: nil } }
      it 'returns a validation failure message' do
        expect { post '/lists', params: invalid_params }.to raise_exception(ActiveRecord::RecordInvalid)
      end
    end
  end

  describe 'PUT /products/:id' do
    context 'when the record exists' do
      before { put "/products/#{product_id}", params: { name: 'Nutella' } }
      it 'update the record' do
        expect(assigns(:product).name).to eq('Nutella')
      end
    end
  end

  describe 'DELETE /products/:id' do
    before { delete "/products/#{product_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

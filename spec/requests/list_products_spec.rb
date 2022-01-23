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
        expect(assigns(:list_products).size).to eq(1)
      end
    end
  end

  describe 'POST /lists/:id/products' do
    let(:new_product) { create(:product) }
    context 'when request has valid params' do
      let(:valid_params) { { amount: 1, product_id: new_product.id } }
      before { post "/lists/#{list.id}/products", params: valid_params }
      it 'expected to create a new list-product' do
        expect(assigns(:list_product).amount).to eq(1)
      end
    end

    context 'when request has invalid params' do
      let(:invalid_params) { { amount: 0, product_id: new_product.id } }
      it 'returns a validation failure message' do
        expect { post "/lists/#{list.id}/products" }.to raise_exception(ActiveRecord::RecordInvalid)
      end
    end
  end
end

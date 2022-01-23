# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists do
    resources :products, controller: 'list_products'
  end
  resources :products
end

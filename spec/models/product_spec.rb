# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'associations' do
    it { should have_many(:list_products) }
  end
  context 'validations' do
    it { should validate_presence_of(:name) }
  end
end

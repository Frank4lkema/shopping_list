# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  context 'associations' do
    it { should have_many(:list_products).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_presence_of(:date) }
  end
end

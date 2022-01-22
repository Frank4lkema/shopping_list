# frozen_string_literal: true

class ListProduct < ApplicationRecord
  # Associations
  belongs_to :list, required: true
  belongs_to :product, required: true

  # Validations
  validates :amount, numericality: { greater_than: 0}

end

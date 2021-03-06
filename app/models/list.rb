# frozen_string_literal: true

class List < ApplicationRecord
  # Associations
  has_many :list_products, dependent: :destroy

  # Validations
  validates :date, presence: true

  # SCOPES
  scope :future_lists, lambda {
    where('date >= ? ', Date.today)
  }
end

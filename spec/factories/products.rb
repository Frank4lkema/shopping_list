# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Food.ingredient }
    standard { false }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    date { Faker::Date.between(from: '2014-09-23', to: '2025-09-25') }
  end
end

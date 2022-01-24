# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    date { Faker::Date.between(from: '2022-09-23', to: '2029-09-25') }
  end
end

# frozen_string_literal: true

List.destroy_all
Product.destroy_all

lists = []
product = []

10.times do
  lists << List.create(date: Faker::Date.between(from: '2014-09-23', to: '2025-09-25'))
end

100.times do
  product << Product.create(
    name: Faker::Food.ingredient,
    standard: false
  )
end

lists.each do |list|
  product.sample(10).each do |product|
    ListProduct.create(
      product: product,
      list: list,
      amount: rand(1..3)
    )
  end
end
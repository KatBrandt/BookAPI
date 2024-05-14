FactoryBot.define do
  factory :store_book do
    store 
    book
    book_price { Faker::Commerce.price }
    quantity { Faker::Number.between(from: 1, to: 200) }
  end
end

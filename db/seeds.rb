# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
100.times do
  Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    genre: Faker::Book.genre,
    summary: Faker::Lorem.paragraph,
    number_sold: Faker::Number.within(range: 1..1000)
  )
end

5.times do
  Store.create!(name: Faker::Company.name) 
end

books = Book.all

books.each do |book|
  store_id_1 = rand(1..5)
  store_id_2 = rand(1..5)

  StoreBook.create!([
    {
      book_id: book.id,
      store_id: store_id_1,
      book_price: rand(100..10000),
      quantity: rand(1..10)
    },
    {
      book_id: book.id,
      store_id: store_id_2,
      book_price: rand(100..10000),
      quantity: rand(1..10)
    }
  ])
end
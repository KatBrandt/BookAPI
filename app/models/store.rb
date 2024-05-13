class Store < ApplicationRecord
  has_many :store_books
  has_many :books, through: :store_books

  def num_books
    books.count
  end
end

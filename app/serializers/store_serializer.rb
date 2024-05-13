class StoreSerializer
  def self.format_data(stores)
    stores.map do |store|
      {
        data: [
          type: "store",
          attributes: {
            name: store.name,
            num_books: store.books.count
          },
          relationships: {
            books: {
              data: get_book_data(store)
            }
          }
        ]
      }
    end
  end

  def self.get_book_data(store)
    store.books.map do |book|
      {
        id: book.id,
        type: "book"
      }
    end
  end
end
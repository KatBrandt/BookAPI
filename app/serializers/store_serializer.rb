class StoreSerializer
  include JSONAPI::Serializer
  attributes :name, :num_books

  has_many :books 

  # Could write customer attribute here, or put this
  # method in the Store Model
  # attribute :num_books do |obj|
  #   obj.books.count
  # end

  attribute :active do 
    true 
  end 
end

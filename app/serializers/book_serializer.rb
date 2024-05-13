class BookSerializer
  include JSONAPI::Serializer
  attributes :title, :author, :genre, :summary, :number_sold

  has_many :stores 
end

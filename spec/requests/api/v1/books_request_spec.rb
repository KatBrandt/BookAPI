require "rails_helper"

describe "Books API" do 
  describe "GET /books" do 
    it "sends a list of books" do 
      create_list(:book, 3)

      get "/api/v1/books"

      books = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      books.each do |book|
        expect(book).to have_key(:id)
        expect(book[:id]).to be_an Integer
        
        expect(book).to have_key(:title)
        expect(book[:title]).to be_a String
        
        expect(book).to have_key(:author)
        expect(book[:author]).to be_a String 
        
        expect(book).to have_key(:genre)
        expect(book[:genre]).to be_a String 
        
        expect(book).to have_key(:summary)
        expect(book[:summary]).to be_a String 
        
        expect(book).to have_key(:number_sold)
        expect(book[:number_sold]).to be_an Integer
      end
    end
  end

  describe "GET /books/:id" do 
    it "shows one book" do 
      book = create(:book)
      
      get "/api/v1/books/#{book.id}"

      expect(response).to be_successful
      
      book_response = JSON.parse(response.body, symbolize_names: true)
      
      expect(book_response).to have_key(:id)
      expect(book_response[:id]).to eq book.id

      expect(book_response).to have_key(:title)
      expect(book_response[:title]).to eq book.title

      expect(book_response).to have_key(:author)
      expect(book_response[:author]).to eq book.author

      expect(book_response).to have_key(:summary)
      expect(book_response[:summary]).to eq book.summary

      expect(book_response).to have_key(:genre)
      expect(book_response[:genre]).to eq book.genre

      expect(book_response).to have_key(:number_sold)
      expect(book_response[:number_sold]).to eq book.number_sold
    end
  end
end
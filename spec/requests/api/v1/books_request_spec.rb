require "rails_helper"

describe "Books API" do 
  describe "GET /books" do 
    scenario "books exist in database" do 
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
    scenario "book exists" do 
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

  describe "POST /books" do 
    scenario "valid params" do 
      book_params = {
        title: "Test Title",
        author: "Test Author",
        genre: "Test Genre",
        summary: "The lazy fox jumped over the brown log.",
        number_sold: 4
      }

      # headers: { "CONTENT_TYPE" => application/json}
      post "/api/v1/books", params: book_params

      expect(response.status).to eq 201

      created_book = Book.last

      expect(created_book.title).to eq book_params[:title]
      expect(created_book.author).to eq book_params[:author]
      expect(created_book.genre).to eq book_params[:genre]
      expect(created_book.summary).to eq book_params[:summary]
      expect(created_book.number_sold).to eq book_params[:number_sold]
    end
  end
end
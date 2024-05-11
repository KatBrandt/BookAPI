require "rails_helper"

describe "Books API V2" do 
  describe "GET /books" do 
    scenario "books exist in database" do 
      create_list(:book, 3)

      get "/api/v2/books"

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
        
        expect(book).to have_key(:popularity)
        expect(book[:popularity]).to be_an Integer

        #change from V1
        expect(book).to_not have_key(:number_sold)
      end
    end
  end
end
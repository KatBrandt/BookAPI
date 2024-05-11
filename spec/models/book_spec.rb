require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "callbacks" do 
    describe "#calculate_popularity before_save" do 
      it "assigns high popularity" do 
        Book.create!(
          title: "New Title",
          author: "Author Name",
          genre: "Fantasy",
          summary: "this is a summary",
          number_sold: 33
        )

        new_book = Book.last 
        expect(new_book.popularity).to eq "High"
      end

      it "assigns low popularity" do 
        Book.create!(
          title: "New Title",
          author: "Author Name",
          genre: "Fantasy",
          summary: "this is a summary",
          number_sold: 2
        )

        new_book = Book.last 
        expect(new_book.popularity).to eq "Low"
      end
    end
  end
end

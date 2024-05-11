class Api::V2::BooksController < ApplicationController
  def index 
    render json: BookSerializer.format_books(Book.all)
  end
end
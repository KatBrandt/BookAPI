class Api::V1::BooksController < ApplicationController
  def index 
    render json: Book.all
  end

  def show
    render json: Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: { message: "Book was created"}, status: 201
    else
      render json: { error: "Could not create book"}, status: 403
    end
  end

  private
  def book_params
    params.permit(:title, :author, :genre, :summary, :number_sold)
  end
end
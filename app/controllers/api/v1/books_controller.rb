class Api::V1::BooksController < ApplicationController
  
  def index 
    render json: BookSerializer.new(Book.all)
  end

  def show
    render json: BookSerializer.new(Book.find(params[:id]))
  end

  def create
    Book.create!(book_params)
    render status: 201
  end

  def update 
    book = Book.find(params[:id])
    if book.update(book_params)
      render status: 200
    else
      render json: { error: "Could not update book"}, status: 403
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.delete
    render json: { message: "Book was deleted"}, status: 200
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :genre, :summary, :number_sold)
  end
end
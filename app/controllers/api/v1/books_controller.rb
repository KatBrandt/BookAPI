class Api::V1::BooksController < ApplicationController
  
  def index 
    render json: BookSerializer.new(Book.all)
  end

  def show
    render json: BookSerializer.new(Book.find(params[:id]))
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: { message: "Book was created"}, status: 201
    else
      render json: { error: "Could not create book"}, status: 400
    end
  end

  def update 
    book = Book.find(params[:id])
    if book.update(book_params)
      render json: { message: "Book was modified"}, status: 200
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
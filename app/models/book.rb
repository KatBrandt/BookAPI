class Book < ApplicationRecord
  before_save :calculate_popularity

  has_many :store_books
  has_many :stores, through: :store_books

  private
  def calculate_popularity
    if number_sold > 5
      self.popularity = "High"
    else
      self.popularity = "Low"
    end
  end
end

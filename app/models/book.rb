class Book < ApplicationRecord
  before_save :calculate_popularity

  private
  def calculate_popularity
    if number_sold > 5
      self.popularity = "High"
    else
      self.popularity = "Low"
    end
  end
end

require 'rails_helper'

RSpec.describe Store, type: :model do
  describe "associations" do 
    describe "associations" do 
    it { should have_many :store_books}
    it { should have_many :books }
  end
  end
end

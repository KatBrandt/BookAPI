require 'rails_helper'

RSpec.describe StoreBook, type: :model do
  describe "associations" do 
    describe "associations" do 
    it { should belong_to :store}
    it { should belong_to :book }
  end
  end
end

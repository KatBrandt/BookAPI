require "rails_helper"

describe "Stores API V1" do 
  describe "GET /stores" do 
    scenario "stores exist in database" do 
      store_1, store_2 = create_list(:store, 2)
      books = create_list(:book, 9)
      store_1.books << books[0..4]
      store_2.books << books[5..9]

      get "/api/v1/stores"

      stores = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(stores).to have_key(:data)
      expect(stores[:data]).to be_an Array

      stores[:data].each do |store|
        expect(store).to have_key(:attributes)
        expect(store).to have_key(:id)
        expect(store).to have_key(:type)
        expect(store[:type]).to eq "store"

        expect(store[:attributes]).to have_key(:name)
        expect(store[:attributes]).to have_key(:num_books)

        expect(store[:attributes][:name]).to be_a String
        expect(store[:attributes][:num_books]).to be_an Integer
      end
    end
  end

  describe "GET /stores/:id" do 
    scenario "store exists" do 
      store = create(:store)
      
      get "/api/v1/stores/#{store.id}"

      expect(response).to be_successful
      
      store_response = JSON.parse(response.body, symbolize_names: true)


      expect(store_response).to have_key(:data)
      expect(store_response[:data]).to have_key(:attributes)
      expect(store_response[:data]).to have_key(:id)
      expect(store_response[:data][:id].to_i).to eq store.id

      expect(store_response[:data]).to have_key(:type)
      expect(store_response[:data][:type]).to eq "store"

      expect(store_response[:data][:attributes]).to have_key(:name)
      expect(store_response[:data][:attributes]).to have_key(:num_books)

      expect(store_response[:data][:attributes][:name]).to eq store.name
      expect(store_response[:data][:attributes][:num_books]).to eq store.num_books
    end
  end
end
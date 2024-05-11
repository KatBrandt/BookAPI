require "rails_helper"

describe "Stores API V1" do 
  describe "GET /stores" do 
    scenario "stores exist in database" do 
      create_list(:store, 3)

      get "/api/v1/stores"

      stores = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      stores.each do |store|
        expect(store).to have_key(:id)
        expect(store[:id]).to be_an Integer
        
        expect(store).to have_key(:name)
        expect(store[:name]).to be_a String
      end
    end
  end

  describe "GET /stores/:id" do 
    scenario "store exists" do 
      store = create(:store)
      
      get "/api/v1/stores/#{store.id}"

      expect(response).to be_successful
      
      store_response = JSON.parse(response.body, symbolize_names: true)

      expect(store_response).to have_key(:id)
      expect(store_response[:id]).to eq store.id

      expect(store_response).to have_key(:name)
      expect(store_response[:name]).to eq store.name
    end
  end
end
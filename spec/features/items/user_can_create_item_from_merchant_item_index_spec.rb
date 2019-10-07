require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit a Merchant Items Index page merchants/:merchant_id/items" do
    it "has a link to add a new item for that merchant" do
      merchant_3 = Merchant.create( name: "Your More Store",
                                    address: "890 Aardvark Dr.",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "80201")

      blanket = merchant_3.items.create( name: "Blanket",
                            description: "Soft and lightweight blanket",
                            price: 4.50,
                            image: '/assets/blanket.png',
                            status: 'inactive',
                            inventory: 4,
                          )
      visit "merchants/#{merchant_3.id}/items"
      expect(page).to have_link("Add Item")

      click_link "Add Item"

      expect(current_path).to eq("/merchants/#{merchant_3.id}/items/new")
      # save_and_open_page
      fill_in "Name", with: "Safety Goggles"
      fill_in "Price", with: 4.7
      fill_in "Description", with: "Keep your eyeballs safe."
      fill_in "Image URL", with: "https://cdn.pixabay.com/photo/2015/07/28/17/10/safety-glasses-864648_1280.jpg"
      fill_in "Inventory", with: 100
      click_button "Create New Item"

      expected_item = merchant_3.items.all.last

      expect(current_path).to eq("/merchants/#{merchant_3.id}/items")
      expect(page).to have_content("Safety Goggles")
      expect(expected_item.status).to eq("Active")
    end
  end
end

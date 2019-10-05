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

      expect(current_url).to eq("/merchants/#{merchant_3.merchant_id}/items/new")

    end
  end

  describe "On '/merchants/:merchant_id/items/new'" do
    describe "I can create a new item" do
      it "has a form to fill in with the items #
        - name
        - price
        - description
        - image
        - inventory" do


      end
    end
  end
end
#
# As a visitor
# When I visit a Merchant Items Index page
# Then I see a link to add a new item for that merchant
# When I click the link
# I am taken to '/merchants/:merchant_id/items/new' where I see a form to add a new item
# When I fill in the form with the item's:
# - name
# - price
# - description
# - image
# - inventory
# Then a `POST` request is sent to '/merchants/:merchant_id/items',
# a new item is created for that merchant,
# that item has a status of 'active',
# and I am redirected to the Merchant Items Index page where I see the new item

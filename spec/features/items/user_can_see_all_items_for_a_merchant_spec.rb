require 'rails_helper'

RSpec.describe "On the merchants/:merchant_id/items page" do
  describe "as a visitor" do
    describe "I see each Item that belongs to the merchant with that merchant_id" do
      it "includes the Item's:
          # - name
          # - price
          # - image
          # - active/inactive status
          # - inventory" do

        merchant_1 = Merchant.create( name: "Corner Store",
                                      address: "234 Yarp Dr.",
                                      city: "Denver",
                                      state: "CO",
                                      zip: "80211")

        lightbulb = merchant_1.items.create( name: "Lightbulb",
                              description: "Let there be light",
                              price: 4.50,
                              image: '/assets/lightbulb.jpg',
                              status: 'active',
                              inventory: 12,
                            )

        keys = merchant_1.items.create( name: "Key Duplication",
                              description: "Let us create a duplicate key for you fast",
                              price: 4.50,
                              image: '/assets/keys.jpeg',
                              status: 'inactive',
                              inventory: 0,
                            )

        visit "/merchants/#{merchant_1.id}/items"

        expect(page).to have_content("Key duplication")
        expect(page).to have_content("Let us create a duplicate key for you fast")
        expect(page).to have_content("Price: $4.50")
        expect(page).to have_content("Status: active")
        expect(page).to have_content("Inventory: 12")

        expect(page).to have_content("Lightbulb")
        expect(page).to have_content("Let there be light")
        expect(page).to have_content("Price: $4.50")
        expect(page).to have_content("Status: active")
        expect(page).to have_content("Inventory: 0")

      end
    end
  end
end

# As a visitor
# When I visit '/merchants/:merchant_id/items'
# Then I see each Item that belongs to the Merchant with that merchant_id including the Item's:
# - name
# - price
# - image
# - active/inactive status
# - inventory

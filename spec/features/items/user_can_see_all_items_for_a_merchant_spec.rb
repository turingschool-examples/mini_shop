require 'rails_helper'

RSpec.describe "On the merchants/:merchant_id/items page" do
  describe "as a visitor" do
    describe "I see each Item that belongs to the merchant with that merchant_id
      including the Item's:
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

      keys = merchant_1.items.create( name: "Key duplication",
                            description: "Let us create a duplicate key for you fast",
                            price: 4.50,
                            image: '/assets/keys.jpeg',
                            status: 'active',
                            inventory: 12,
                          )

      visit "/merchants/#{merchant_1.id}/items"


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

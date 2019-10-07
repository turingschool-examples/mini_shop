require 'rails_helper'

RSpec.describe "On an Item Show Page" do
  describe "I can delete an item" do
    it "deletes with a click and redirects to the item index page" do

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

      visit "/items/#{lightbulb.id}"
      click_link "Delete Item"

      expect(current_path).to eq("/items")
      expect(page).to_not have_content("Lightbulb")
      expect(page).to_not have_content("Let there be light")
    end
  end
end

# As a visitor
# When I visit an item show page
# Then I see a link to delete the item
# When I click the link
# Then a 'DELETE' request is sent to '/items/:id',
# the item is deleted,
# and I am redirected to the item index page where I no longer see this item

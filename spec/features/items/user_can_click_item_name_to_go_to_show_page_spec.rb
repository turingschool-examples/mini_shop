require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I click on the name of an item anywhere on the site" do
    it "the link takes me to that item's show page" do

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

      visit "/items"
      click_link "Lightbulb"
      expect(current_path).to eq("/items/#{lightbulb.id}")

      visit "/merchants/#{merchant_1.id}/items"
      click_link "Lightbulb"
      expect(current_path).to eq("/items/#{lightbulb.id}")
    end
  end
end

#                     As a visitor
# When I click on the name a item anywhere on the site
# Then that link takes me to that Item's show page

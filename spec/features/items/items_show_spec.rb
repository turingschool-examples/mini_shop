require 'rails_helper'

describe "Item show page" do
  describe "As a visitor", type: feature do
    it "can see the item with that id including the item's params" do

      merchant = Merchant.create( name: "Hello Goods",
                                  address: "456 Real Ave",
                                  city: "Denver",
                                  state: "Colroado",
                                  zip: 80999
      )

      item = merchant.items.create!(  name: "Solid Gold Playing Cards",
                            description: "One set of 52 solid gold playing cards.",
                            price: 1200,
                            image: "https://i.imgur.com/LlHMnHG.jpg",
                            status: "Active",
                            inventory: 2,
      )

      visit "/items/#{item.id}"

      expect(page).to have_content("Solid Gold Playing Cards")
      expect(page).to have_content("One set of 52 solid gold playing cards.")
      expect(page).to have_content(1200)
      expect(page).to have_css("img[src*='https://i.imgur.com/LlHMnHG.jpg']")
      expect(page).to have_content("Active")
      expect(page).to have_content(2)
      expect(page).to have_content("Hello Goods")

    end
  end
end
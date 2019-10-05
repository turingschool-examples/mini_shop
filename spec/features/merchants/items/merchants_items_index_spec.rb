require 'rails_helper'

describe "Merchants items index page" do
  describe "As a visitor", type: feature do
    it "can see see each Item that belongs to the Merchant including Item's params" do

      merchant = Merchant.create( name: "Chesters Collectables",
                                        address: "123 Fake St",
                                        city: "Awesomeville",
                                        state: "Montana",
                                        zip: 59001,
      )

      item = merchant.items.create!( name: "Solid Gold Playing Cards",
                              description: "One set of 52 solid gold playing cards.",
                              price: 1200,
                              image: "https://i.imgur.com/LlHMnHG.jpg",
                              status: "Active",
                              inventory: 2,
          )

      visit "/merchants/#{merchant.id}/items"

      expect(page).to have_content("Solid Gold Playing Cards")
      expect(page).to have_content("One set of 52 solid gold playing cards.")
      expect(page).to have_content(1200)
      expect(page).to have_css("img[src*='https://i.imgur.com/LlHMnHG.jpg']")
      expect(page).to have_content("Active")
      expect(page).to have_content(2)

    end
  end
end
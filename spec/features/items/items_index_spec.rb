require 'rails_helper'

describe "Item index page" do
  describe "As a visitor", type: :feature do
    it "can see the item index page" do

      merchant = Merchant.create( name: "Hello Goods",
                                  address: "456 Real Ave",
                                  city: "Denver",
                                  state: "Colroado",
                                  zip: 80999
      )

      item = merchant.items.create!( name: "Solid Gold Playing Cards",
                          description: "One set of 52 solid gold playing cards.",
                          price: 1200,
                          image: "https://i.imgur.com/LlHMnHG.jpg",
                          status: "Active",
                          inventory: 2,
      )

      visit '/items'

      expect(page).to have_content(item.name)
      expect(page).to have_content(item.description)
      expect(page).to have_content(item.price)
      expect(page).to have_css("img[src*='https://i.imgur.com/LlHMnHG.jpg']")
      expect(page).to have_content(item.status)
      expect(page).to have_content(item.inventory)
      expect(page).to have_content(item.merchant_name)

    end
  end
end
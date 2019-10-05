require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "I visit the item index page" do
    it "I see all items" do
      merchant_1 = Merchant.create(name: "Sam's Sports")
      item_1 = Item.create( name: "Basketball",
                            description: "Regulation size basketball",
                            price: 12.99,
                            image: "",
                            active: true,
                            inventory:"",
                            merchant: merchant_1
                          )

      visit "/items"

      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_1.description)
      expect(page).to have_content(item_1.price)
      expect(page).to have_content(item_1.image)
      expect(page).to have_content("in stock")
      expect(page).to have_content(item_1.inventory)
      expect(page).to have_content(item_1.merchant.name)
    end
  end
end

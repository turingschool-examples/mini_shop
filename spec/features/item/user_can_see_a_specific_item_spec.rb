require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "I visit the item show page" do
    it "I see details for just that item" do
      merchant_1 = Merchant.create(name: "Sam's Sports")
      item_1 = Item.create( name: "Basketball",
                            description: "Regulation size basketball",
                            price: 12.99,
                            image: "image path",
                            active: true,
                            inventory:15,
                            merchant_id: merchant_1.id
                          )

      visit "/items/#{item_1.id}"

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_1.image)
    expect(page).to have_content("Active")
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_content(merchant_1.name)

    end
  end
end

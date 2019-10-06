require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I click the add an item button on a merchant's item page" do
    it "I see a form I can use to create a new item" do

      merchant_1 = Merchant.create(name: "Sam's Sports")

      item_1 = Item.new( name: "Basketball",
                            description: "Regulation size basketball",
                            price: 12.99,
                            image: "image path",
                            active: false,
                            inventory:15,
                            merchant_id: merchant_1.id
                          )

      visit "/merchants/#{merchant_1.id}/items"

      click_on 'Add an item'

      expect(current_path).to eq("/merchants/#{merchant_1.id}/items/new")

      fill_in :name, with: 'Basketball'
      fill_in :description, with: 'Regulation size basketball'
      fill_in :image, with: 'image path'
      fill_in :price, with: 12.99
      fill_in :inventory, with: 15
      click_on 'Create Item'

      expect(current_path).to eq("/merchants/#{merchant_1.id}/items")
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

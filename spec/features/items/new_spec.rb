require 'rails_helper'

RSpec.describe "Merchant Item Creation" do
  describe "As a visitor" do
    it "I see a link to add a new item for that merchant" do

      merchant_1 = Merchant.create!(
        name: "Knees Weak",
        address: "1 Oppurtunity Way",
        city: "Denver",
        state: "Colorado",
        zip: 80229
      )

      visit merchant_items_path(merchant_1)

      click_on "New Item"

      expect(current_path).to eq(new_merchant_item_path(merchant_1))

      fill_in :name, with: "Knee Brace"
      fill_in :price, with: 14.99
      fill_in :description, with: "Prevent knee injuries"
      fill_in :image, with: "knee_brace.jpg"
      fill_in :inventory, with: 30
      click_on 'Create Item'

      expect(current_path).to eq(merchant_items_path(merchant_1))

      item_1 = Item.last

      within(".item-#{item_1.id}") do
        expect(page).to have_content(item_1.name)
        expect(page).to have_content("Description: #{item_1.description}")
        expect(page).to have_content("Merchant: #{merchant_1.name}")
        expect(page).to have_content("Active: True")
      end
    end
  end
end

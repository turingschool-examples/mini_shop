require 'rails_helper'

RSpec.describe "Items Index" do
  describe "As a Visitor" do
    it "I see the each item in the system with their attributes" do
      item = Item.create!(name: "Necklace", description: "Shell on chain", price: 30, image: "xx", status: "Active", inventory: 3, merchant_name: "She Sells Seashells")

      # image_tag entry.filename?
      visit "/items"

      expect(page).to have_content(item.name)
      expect(page).to have_content(item.description)
      expect(page).to have_content(item.price)
      expect(page).to have_content(item.image)
      expect(page).to have_content(item.status)
      expect(page).to have_content(item.inventory)
      expect(page).to have_content(item.merchant_name)
    end
  end
end

require 'rails_helper'

RSpec.describe "Item Show" do
  describe "As a visitor" do
    it "I see the item with that id including the item's\n
    -name\n
    -active/inactive status\n
    -price\n
    -description\n
    -image\n
    -inventory\n
    -the name of the merchant that sells the item" do

    merchant_1 = Merchant.create!(
      name: "Knees Weak",
      address: "1 Oppurtunity Way",
      city: "Denver",
      state: "Colorado",
      zip: 80229
    )

    merchant_2 = Merchant.create!(
      name: "Mom's Spaghetti",
      address: "1 Moment Way",
      city: "Las Vegas",
      state: "Nevada",
      zip: 80003
    )

    item_1 = merchant_1.items.create!(
      name: "Knee Brace",
      description: "Prevent knee injuries",
      price: 14.99,
      image: "knee_brace.jpg",
      active: true,
      inventory: 30
    )

    item_2 = merchant_2.items.create!(
      name: "Italian Spices",
      description: "Seasoning for sauce",
      price: 4.99,
      image: "spices.jpg",
      active: true,
      inventory: 30
    )

    visit item_path(item_1)

    within(".item-#{item_1.id}") do
      expect(page).to have_content(item_1.name)
      expect(page).to have_content("Description: #{item_1.description}")
      expect(page).to have_content("Merchant: #{merchant_1.name}")
    end

    visit item_path(item_2)

    within(".item-#{item_2.id}") do
      expect(page).to have_content(item_2.name)
      expect(page).to have_content("Description: #{item_2.description}")
      expect(page).to have_content("Merchant: #{merchant_2.name}")
    end
    end
  end
end

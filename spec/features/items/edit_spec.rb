require 'rails_helper'

RSpec.describe "Item Update" do
  describe "As a visitor" do
    describe "When I visit the Item Show page" do
      it "I can update an item" do

        merchant_1 = Merchant.create!(
          name: "Knees Weak",
          address: "1 Oppurtunity Way",
          city: "Denver",
          state: "Colorado",
          zip: 80229
        )

        item_1 = merchant_1.items.create!(
          name: "Knee Brace",
          description: "Prevent knee injuries",
          price: 14.99,
          image: "knee_brace.jpg",
          active: true,
          inventory: 30
        )

        visit item_path(item_1)

        click_link 'Edit'

        expect(current_path).to eq(edit_item_path(item_1))

        fill_in :name, with: "Knee Pads"
        fill_in :price, with: 19.99
        fill_in :description, with: "Prevent knee injuries when falling"
        fill_in :image, with: "knee_pads.jpg"
        fill_in :inventory, with: 50
        click_on 'Update Item'

        expect(current_path).to eq(item_path(item_1))
        within(".item-#{item_1.id}") do
          expect(page).to have_content("Knee Pads")
          expect(page).to have_content("Description: Prevent knee injuries when falling")
        end
      end
    end
  end
end

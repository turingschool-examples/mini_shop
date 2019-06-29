require 'rails_helper'

RSpec.describe "Merchants Show" do
  describe "As a Visitor" do
    describe "When I visit the items show page" do
      it "I see the item with that id and its attributes" do

        merchant_1 = Merchant.create(name: "She Sells Seashells", address: "1234 Market St", city: "Denver", state: "CO", zipcode: "80220")
        item = Item.create!(name: "Necklace", description: "Shell on chain", price: 30, image: "file_path", active_status: true, inventory: 3, merchant_id: merchant_1.id)

        visit "/items/#{item.id}"

        expect(page).to have_content(item.name)
        expect(page).to have_content(item.active_status)
        expect(page).to have_content(item.price)
        expect(page).to have_content(item.description)
        expect(page).to have_content(item.image)
        expect(page).to have_content(item.inventory)
        expect(page).to have_content(item.merchant.name)
      end
    end
  end
end

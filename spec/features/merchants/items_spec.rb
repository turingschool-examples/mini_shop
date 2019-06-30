require 'rails_helper'

RSpec.describe "Merchant's Items" do
  describe "As a Visitor" do
    describe "When I visit the Merchant's Items Page" do
      it "I see the Mercant's items and their details" do

        merchant_1 = Merchant.create(name: "She Sells Seashells", address: "1234 Market St", city: "Denver", state: "CO", zipcode: "80220")
        item = Item.create!(name: "Necklace", description: "Shell on chain", price: 30, image: "file_path", active_status: true, inventory: 3, merchant_id: merchant_1.id)

        visit "/merchants/#{merchant_1.id}/items"

        expect(page).to have_content(item.name)
        expect(page).to have_content(item.price)
        expect(page).to have_content(item.active_status)
        expect(page).to have_content(item.inventory)
      end
    end
  end
end

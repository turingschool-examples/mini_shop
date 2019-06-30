require 'rails_helper'

RSpec.describe "Merchants Index" do
  describe "As a Visitor" do
    describe "When I visit a Merchant's items page" do
      it "I see each item that belongs to that merchant and its attributes" do

        merchant = Merchant.create!(name: "She Sells Seashells", address: "1234 Market St", city: "Denver", state: "CO", zipcode: "80220")
        item = Item.create!(name: "Necklace", description: "Shell on chain", price: 30, image: "xx", active_status: true, inventory: 3, merchant_id: merchant.id)


        visit "/merchants/#{merchant.id}/items"

        expect(page).to have_content(item.name)
        expect(page).to have_content(item.price)
        expect(page).to have_content(item.active_status)
        expect(page).to have_content(item.inventory)
      end
    end
  end
end

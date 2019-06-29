require 'rails_helper'

RSpec.describe "Item Links" do
  describe "As a Visitor" do
    describe "When I click on the name a item anywhere on the site" do
      it "Then that link takes me to that Item's show page"  do

        merchant_1 = Merchant.create(name: "Cheese & Wine", address: "1234 Market St", city: "Denver", state: "CO", zipcode: "80220")
        item = Item.create!(name: "Wine", description: "Merlot", price: 25, image: "file_path", active_status: true, inventory: 10, merchant_id: merchant_1.id)

        visit items_path

        click_link "Wine"

        expect(current_path).to eq(item_path(item))
      end
    end
    describe "When I am on the merchant's items page" do
      it "The item's name link takes me to that item's show page" do

        merchant_2 = Merchant.create(name: "Rubber Duckies", address: "4444 Market St", city: "Denver", state: "CO", zipcode: "80220")
        item_1 = Item.create!(name: "Ducky", description: "Toy", price: 5, image: "file_path", active_status: true, inventory: 3, merchant_id: merchant_2.id)

        visit "/merchants/#{merchant_2.id}/items"

        click_link "Ducky"

        expect(current_path).to eq(item_path(item_1))
      end
    end
  end
end

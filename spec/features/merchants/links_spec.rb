require 'rails_helper'

RSpec.describe "Merchant Links" do
  describe "As a Visitor" do
    describe "When I click on the name a merchant anywhere on the site" do
      it "Then that link takes me to that Merchant's show page"  do

        merchant_1 = Merchant.create(name: "Cheese & Wine", address: "1234 Market St", city: "Denver", state: "CO", zipcode: "80220")

        visit merchants_path

        click_link "Cheese & Wine"

        expect(current_path).to eq(merchant_path(merchant_1))
      end
    end
    describe "When I am on the merchant's items page" do
      it "The merchant link takes me to that Merchant's show page" do

        merchant_1 = Merchant.create(name: "Rubber Duckies", address: "4444 Market St", city: "Denver", state: "CO", zipcode: "80220")
        item = Item.create!(name: "Ducky", description: "Toy", price: 5, image: "file_path", active_status: true, inventory: 3, merchant_id: merchant_1.id)

        visit items_path

        click_link "Rubber Duckies"

        expect(current_path).to eq(merchant_path(merchant_1))
      end
    end
    describe "When I am on the merchant's items page" do
      it "The merchant link takes me to that Merchant's show page" do

        merchant_3 = Merchant.create(name: "Healing Horses", address: "4344 Market St", city: "Denver", state: "CO", zipcode: "80220")
        item = Item.create!(name: "Horse", description: "Stuffed animal", price: 20, image: "file_path", active_status: true, inventory: 3, merchant_id: merchant_3.id)

        visit item_path(item)

        click_link "Healing Horses"

        expect(current_path).to eq(merchant_path(merchant_3))
      end
    end    
  end
end

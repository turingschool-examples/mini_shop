require "rails_helper"

RSpec.describe "Items Index Page", type: :feature do
  describe "As a visitor" do
    before(:each) do
      @merchant_1 = Merchant.create!(name: "Merchant 1", address: "Address 1", city: "City 1", state: "State 1", zip: "Zip 1")
      @merchant_2 = Merchant.create!(name: "Merchant 2", address: "Address 2", city: "City 2", state: "State 2", zip: "Zip 2")

      @item_1 = Item.create!(name: "Item 1", description: "Description 1", price: 1.00, image: "https://giantbomb1.cbsistatic.com/uploads/scale_small/1/16207/1186400-oss.png", status: true, inventory: 5, merchant: @merchant_1)
      @item_2 = Item.create!(name: "Item 2", description: "Description 2", price: 2.00, image: "https://giantbomb1.cbsistatic.com/uploads/scale_small/8/87790/1806078-box_mmbn.png", status: true, inventory: 5, merchant: @merchant_2)
    end

    it "I see each Item in the system and all the Item's info" do

      visit "/items"

        expect(page).to have_content(@item_1.name)
        expect(page).to have_content(@item_1.description)
        expect(page).to have_content(@item_1.price)
        expect(page).to have_content(@item_1.status)
        expect(page).to have_content(@item_1.inventory)
        expect(page).to have_content(@item_1.merchant.name)
        expect(page).to have_css("img[src*='#{@item_1.image}']")
        expect(page).to have_content(@item_2.name)
        expect(page).to have_content(@item_2.description)
        expect(page).to have_content(@item_2.price)
        expect(page).to have_content(@item_2.status)
        expect(page).to have_content(@item_2.inventory)
        expect(page).to have_content(@item_2.merchant.name)
        expect(page).to have_css("img[src*='#{@item_2.image}']")
      end
    end
  end

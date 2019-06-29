require "rails_helper"

RSpec.describe "Items Index Page", type: :feature do
  describe "As a visitor" do
    before(:each) do
      @merchant_1 = Merchant.create!(name: "Merchant 1", address: "Address 1", city: "City 1", state: "State 1", zip: "Zip 1")

      @item_1 = Item.create!(name: "Item 1", description: "Description 1", price: 1.00, image: "https://www.westelm.com/weimgs/rk/images/wcm/products/201916/0031/img7c.jpg", active: true, inventory: 5, merchant: @merchant_1)
      @item_2 = Item.create!(name: "Item 2", description: "Description 2", price: 2.00, image: "https://www.westelm.com/weimgs/rk/images/wcm/products/201922/0578/img66c.jpg", active: true, inventory: 5, merchant: @merchant_1)
      @item_3 = Item.create!(name: "Item 3", description: "Description 3", price: 3.00, image: "https://www.westelm.com/weimgs/rk/images/wcm/products/201922/0181/slope-leather-lounge-chair-c.jpg", active: true, inventory: 5, merchant: @merchant_1)
    end

    it "I see each Item in the system and all the Item's info" do
      visit "/items"

      within "#item-id-#{@item_1.id}" do
        expect(page).to have_content(@item_1.name)
        expect(page).to have_content(@item_1.description)
        expect(page).to have_content(@item_1.price)
        expect(page).to have_content(@item_1.active)
        expect(page).to have_content(@item_1.inventory)
        expect(page).to have_content(@item_1.merchant.name)
        expect(page).to have_css("img[src*='#{@item_1.image}']")
      end

      within "#item-id-#{@item_2.id}" do
        expect(page).to have_content(@item_2.name)
        expect(page).to have_content(@item_2.description)
        expect(page).to have_content(@item_2.price)
        expect(page).to have_content(@item_2.active)
        expect(page).to have_content(@item_2.inventory)
        expect(page).to have_content(@item_2.merchant.name)
        expect(page).to have_css("img[src*='#{@item_2.image}']")
      end

      within "#item-id-#{@item_3.id}" do
        expect(page).to have_content(@item_3.name)
        expect(page).to have_content(@item_3.description)
        expect(page).to have_content(@item_3.price)
        expect(page).to have_content(@item_3.active)
        expect(page).to have_content(@item_3.inventory)
        expect(page).to have_content(@item_3.merchant.name)
        expect(page).to have_css("img[src*='#{@item_3.image}']")
      end
    end
  end
end

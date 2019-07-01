require "rails_helper"

RSpec.describe "Item Show Page", type: :feature do
  describe "As a visitor" do
    before(:each) do
      @merchant_1 = Merchant.create!(name: "Merchant 1", address: "Address 1", city: "City 1", state: "State 1", zip: "Zip 1")

      @item_1 = Item.create!(name: "Item 1", description: "Description 1", price: 1.00, image: "https://www.westelm.com/weimgs/rk/images/wcm/products/201916/0031/img7c.jpg", active: true, inventory: 5, merchant: @merchant_1)
      @item_2 = Item.create!(name: "Item 2", description: "Description 2", price: 2.00, image: "https://www.westelm.com/weimgs/rk/images/wcm/products/201922/0578/img66c.jpg", active: true, inventory: 5, merchant: @merchant_1)

      @merchant_2 = Merchant.create!(name: "Merchant 2", address: "Address 2", city: "City 2", state: "State 2", zip: "Zip 2")

      @item_3 = Item.create!(name: "Item 3", description: "Description 3", price: 3.00, image: "https://www.westelm.com/weimgs/rk/images/wcm/products/201922/0181/slope-leather-lounge-chair-c.jpg", active: true, inventory: 5, merchant: @merchant_2)
    end

    it "I see the item with that id including all the item's info" do
      visit "/items/#{@item_1.id}"

      within "#item-id-#{@item_1.id}" do
        expect(page).to have_content(@item_1.name)
        expect(page).to have_content(@item_1.active)
        expect(page).to have_content(@item_1.price)
        expect(page).to have_content(@item_1.description)
        expect(page).to have_content(@item_1.inventory)
        expect(page).to have_content(@item_1.merchant.name)
        expect(page).to have_css("img[src*='#{@item_1.image}']")
      end

      visit "/items/#{@item_2.id}"

      within "#item-id-#{@item_2.id}" do
        expect(page).to have_content(@item_2.name)
        expect(page).to have_content(@item_2.active)
        expect(page).to have_content(@item_2.price)
        expect(page).to have_content(@item_2.description)
        expect(page).to have_content(@item_2.inventory)
        expect(page).to have_content(@item_2.merchant.name)
        expect(page).to have_css("img[src*='#{@item_2.image}']")
      end

      visit "/items/#{@item_3.id}"

      within "#item-id-#{@item_3.id}" do
        expect(page).to have_content(@item_3.name)
        expect(page).to have_content(@item_3.active)
        expect(page).to have_content(@item_3.price)
        expect(page).to have_content(@item_3.description)
        expect(page).to have_content(@item_3.inventory)
        expect(page).to have_content(@item_3.merchant.name)
        expect(page).to have_css("img[src*='#{@item_3.image}']")
      end
    end

    it "When I click on the Merchant's name, it takes me to that Merchant's show page" do
      visit "/items/#{@item_1.id}"

      within "#item-id-#{@item_1.id}" do
        expect(page).to have_link(@item_1.merchant.name)
        click_link "#{@item_1.merchant.name}"
        expect(current_path).to eq("/merchants/#{@item_1.merchant_id}")
      end

      visit "/items/#{@item_2.id}"

      within "#item-id-#{@item_2.id}" do
        expect(page).to have_link(@item_2.merchant.name)
        click_link "#{@item_2.merchant.name}"
        expect(current_path).to eq("/merchants/#{@item_2.merchant_id}")
      end

      visit "/items/#{@item_3.id}"

      within "#item-id-#{@item_3.id}" do
        expect(page).to have_link(@item_3.merchant.name)
        click_link "#{@item_3.merchant.name}"
        expect(current_path).to eq("/merchants/#{@item_3.merchant_id}")
      end
    end
  end
end

require "rails_helper"

RSpec.describe "Merchant Items Index Page", type: :feature do
  describe "As a visitor" do
    before(:each) do
      @merchant_1 = Merchant.create!(name: "Merchant 1", address: "Address 1", city: "City 1", state: "State 1", zip: "Zip 1")

      @item_1 = Item.create!(name: "Item 1", description: "Description 1", price: 1.00, image: "https://www.westelm.com/weimgs/rk/images/wcm/products/201916/0031/img7c.jpg", active: true, inventory: 5, merchant: @merchant_1)
      @item_2 = Item.create!(name: "Item 2", description: "Description 2", price: 2.00, image: "https://www.westelm.com/weimgs/rk/images/wcm/products/201922/0578/img66c.jpg", active: true, inventory: 5, merchant: @merchant_1)
      @item_3 = Item.create!(name: "Item 3", description: "Description 3", price: 3.00, image: "https://www.westelm.com/weimgs/rk/images/wcm/products/201922/0181/slope-leather-lounge-chair-c.jpg", active: true, inventory: 5, merchant: @merchant_1)

      @merchant_2 = Merchant.create!(name: "Merchant 2", address: "Address 2", city: "City 2", state: "State 2", zip: "Zip 2")

      @item_4 = Item.create!(name: "Item 4", description: "Description 4", price: 3.00, image: "https://www.westelm.com/weimgs/rk/images/wcm/products/201917/0021/roar-rabbit-x-diego-olivero-swivel-chair-1-o.jpg", active: true, inventory: 5, merchant: @merchant_2)
      @item_5 = Item.create!(name: "Item 5", description: "Description 5", price: 3.00, image: "https://www.westelm.com/weimgs/rk/images/wcm/products/201923/0014/phoebe-chair-multi-stripe-o.jpg", active: true, inventory: 5, merchant: @merchant_2)
    end

    it "I see each Item that belongs to the Merchant with that merchant_id and all the Item's info" do
      visit "/merchants/#{@merchant_1.id}/items"
      expect(page).to_not have_content(@item_4.name)
      expect(page).to_not have_content(@item_5.name)

      within "#merchant-item-id-#{@item_1.id}" do
        expect(page).to have_content(@item_1.name)
        expect(page).to have_content(@item_1.price)
        expect(page).to have_content(@item_1.active)
        expect(page).to have_content(@item_1.inventory)
        expect(page).to have_css("img[src*='#{@item_1.image}']")
      end

      within "#merchant-item-id-#{@item_2.id}" do
        expect(page).to have_content(@item_2.name)
        expect(page).to have_content(@item_2.price)
        expect(page).to have_content(@item_2.active)
        expect(page).to have_content(@item_2.inventory)
        expect(page).to have_css("img[src*='#{@item_2.image}']")
      end

      within "#merchant-item-id-#{@item_3.id}" do
        expect(page).to have_content(@item_3.name)
        expect(page).to have_content(@item_3.price)
        expect(page).to have_content(@item_3.active)
        expect(page).to have_content(@item_3.inventory)
        expect(page).to have_css("img[src*='#{@item_3.image}']")
      end

      visit "/merchants/#{@merchant_2.id}/items"

      expect(page).to_not have_content(@item_1.name)
      expect(page).to_not have_content(@item_2.name)
      expect(page).to_not have_content(@item_3.name)

      within "#merchant-item-id-#{@item_4.id}" do
        expect(page).to have_content(@item_4.name)
        expect(page).to have_content(@item_4.price)
        expect(page).to have_content(@item_4.active)
        expect(page).to have_content(@item_4.inventory)
        expect(page).to have_css("img[src*='#{@item_4.image}']")
      end

      within "#merchant-item-id-#{@item_5.id}" do
        expect(page).to have_content(@item_5.name)
        expect(page).to have_content(@item_5.price)
        expect(page).to have_content(@item_5.active)
        expect(page).to have_content(@item_5.inventory)
        expect(page).to have_css("img[src*='#{@item_5.image}']")
      end
    end
  end
end

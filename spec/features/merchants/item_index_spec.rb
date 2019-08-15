require 'rails_helper'

describe "As a visitor" do
  before :each do
    @merchant_1 = Merchant.create(name: "merchant_1", address: "123 Main", city: "Denver", state:"CO", zip:"80204")
    @item_1 = @merchant_1.items.create(name: "flylow chemical", description: "Mens ski pant", price: 325, image: "https://content.backcountry.com/images/items/1200/FLG/FLG0029/FER.jpg" , active: true, inventory: 12)
    @item_1 = @merchant_1.items.create(name: "flylow chemical 2", description: "Mens ski pant 2", price: 325, image: "https://content.backcountry.com/images/items/1200/FLG/FLG0029/FER.jpg" , active: true, inventory: 12)
end

  describe "when I visit '/merchants/:id/items'" do
    it "I see all the items for the merchant" do
      visit "/merchants/#{@merchant_1.id}/items"
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      # binding.pry
      expect(page).to have_css("img[src*='#{@item_1.image}']")
      expect(page).to have_content(@item_1.active)
      expect(page).to have_content(@item_1.inventory)
    end

    end
  end

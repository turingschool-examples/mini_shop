require 'rails_helper'

describe "As a visitor" do
  before :each do
    @merchant_1 = Merchant.create(name: "merchant_1", address: "123 Main", city: "Denver", state:"CO", zip:"80204")
    @merchant_2 = Merchant.create(name: "merchant_2", address: "789 Pacific", city: "Lakewood", state:"CO", zip:"80214")
    @item_1 = @merchant_1.items.create(name: "flylow chemical", description: "Mens ski pant", price: 325, image: "https://content.backcountry.com/images/items/1200/FLG/FLG0029/FER.jpg" , active: true, inventory: 12)
    @item_2 = @merchant_2.items.create(name: "ON3P Jeffrey", description: "Big mountain ski", price: 699, image: "https://cdn.shopify.com/s/files/1/0033/4622/products/2020_Jeffrey116_Preview_165x1000x72px-01_2000x.png?v=1555779770" , active: true, inventory: 9)
end

  describe "when I visit '/items/:id'" do
    it "Then I see all the content of the item" do
      visit "/items/#{@item_1.id}"
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.description)
      expect(page).to have_content(@item_1.price)
      # binding.pry
      expect(page).to have_css("img[src*='#{@item_1.image}']")
      expect(page).to have_content(@item_1.active)
      expect(page).to have_content(@item_1.inventory)
      expect(page).to have_content(@merchant_1.name)
    end
  end
end

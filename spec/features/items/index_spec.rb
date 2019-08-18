require 'rails_helper'

describe "As a visitor" do
  before :each do
    @merchant_1 = Merchant.create(name: "merchant_1", address: "123 Main", city: "Denver", state:"CO", zip:"80204")
    @merchant_2 = Merchant.create(name: "merchant_2", address: "789 Pacific", city: "Lakewood", state:"CO", zip:"80214")
    # binding.pry
    @item_1 = @merchant_1.items.create(name: "flylow chemical", description: "Mens ski pant", price: 325, image: "how do i do this" , active: true, inventory: 12)
    @item_2 = @merchant_2.items.create(name: "ON3P Jeffrey", description: "Big mountain ski", price: 699, image: "how do i do this" , active: true, inventory: 9,)
end

  describe "when I visit '/items'" do
    it "Then I see a list of all items" do
    visit "/items"
    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_2.name)
    # expect(page).to have_link("Create New Merchant")
    end
  end

  describe "when i visit '/merchants/:merchant_id/items'" do
    it "Then i see that merchants items" do
      visit "/merchants/#{@item_1.merchant_id}/items"
      expect(page).to have_content(@item_1.name)
    end
  end
end

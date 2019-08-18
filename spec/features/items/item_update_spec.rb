require 'rails_helper'

describe "As a visitor" do
  before :each do
    @merchant_1 = Merchant.create(name: "merchant_1", address: "123 Main", city: "Denver", state:"CO", zip:"80204")
    @item_1 = @merchant_1.items.create(name: "flylow chemical", description: "Mens ski pant", price: 325, image: "https://content.backcountry.com/images/items/1200/FLG/FLG0029/FER.jpg" , active: true, inventory: 12)
end

  describe "when I visit '/items/:id'" do
    it "Then I see a link to edit item" do
      visit "/items/#{@item_1.id}"
      expect(page).to have_link("Edit Item")

      click_on("Edit Item")
      expect(current_path).to eq("/items/#{@item_1.id}/edit")

      name = "Wax"
      price = 7
      description = "ski wax"
      image = "https://www.hertelskiwax.com/v/vspfiles/photos/WhiteGold-Ski-2.jpg"
      inventory = 22

      fill_in :name, with: name
      fill_in :price, with: price
      fill_in :description, with: description
      fill_in :image, with: image
      fill_in :inventory, with: inventory
      click_on "Submit Item Update"

      expect(current_path).to eq("/items/#{@item_1.id}")
      expect(page).to have_content(name)
      expect(page).to have_content(price)
      expect(page).to have_content(description)
      expect(page).to have_css("img[src*='#{image}']")
      expect(page).to have_content(inventory)
    end
  end
end

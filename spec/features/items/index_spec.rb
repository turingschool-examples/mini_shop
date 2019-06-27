require 'rails_helper'

RSpec.describe "Items Index" do
  describe "As a visitor" do
    it "I see each item and its info in the system" do
      merchant_1 = Merchant.create(name: "What Ales You")
      item_1 = Item.create(name: "Galaxy Hops", description: "Huge hop oil content with pungent citrus and passion fruit flavors.", price: 36.99, image: "galaxy_hops.png", active: true, inventory: 28, merchant_name: merchant_1.name, merchant_id: merchant_1.id)

      visit '/items'

      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_1.description)
      expect(page).to have_content(item_1.price)
      expect(page).to have_content(item_1.image)
      expect(page).to have_content(item_1.active)
      expect(page).to have_content(item_1.inventory)
      expect(page).to have_content(item_1.merchant_name)
    end

  end
end

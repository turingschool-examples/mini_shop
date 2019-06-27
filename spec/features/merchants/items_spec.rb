require 'rails_helper'

RSpec.describe "Merchants Items Index" do
  describe "As a visitor" do
    it "When I visit a merchants page I see a list of their items including item info" do
      merchant = Merchant.create(name: "What Ales You")
      item = merchant.items.create(name: "Galaxy Hops", description: "Huge hop oil content with pungent citrus and passion fruit flavors.", price: 36.99, image: "https://morebeer-web-8-pavinthewaysoftw.netdna-ssl.com/product_image/morebeer/500x500/22454.png", active: true, inventory: 28)

      visit "/merchants/#{merchant.id}/items"

      expect(page).to have_content(item.name)
      expect(page).to have_content(item.price)
      expect(page).to have_content(item.active)
      expect(page).to have_content(item.inventory)
    end

  end
end

# Then I see each Item that belongs to the Merchant with that merchant_id including the Item's:
# - name
# - price
# - image
# - active/inactive status
# - inventory

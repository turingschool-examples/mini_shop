require "rails_helper"

RSpec.describe "Merchant Items Index Page", type: :feature do
  describe "As a visitor" do
    before(:each) do
      @merchant_1 = Merchant.create!(name: "Megaman vendor ", address: "Address 1", city: "City 1", state: "State 1", zip: "Zip 1")
#change items to mine
@item_1 = Item.create!(name: "Item 1", description: "Description 1", price: 1.00, image: "https://giantbomb1.cbsistatic.com/uploads/scale_small/1/16207/1186400-oss.png", status: true, inventory: 5, merchant: @merchant_1)

@item_2 = Item.create!(name: "Item 2", description: "Description 2", price: 2.00, image: "https://giantbomb1.cbsistatic.com/uploads/scale_small/8/87790/1806078-box_mmbn.png", status: true, inventory: 5, merchant: @merchant_1)

      @merchant_2 = Merchant.create!(name: "pokemon vendor ", address: "Address 2", city: "City 2", state: "State 2", zip: "Zip 2")
      @item_3 = Item.create!(name: "Item 3", description: "Description 3", price: 3.00, image: "https://images-na.ssl-images-amazon.com/images/I/616P8A8MYQL.jpg", status: true, inventory: 5, merchant: @merchant_2)

      @item_4 = Item.create!(name: "Item 4", description: "Description 4", price: 3.00, image: "https://img.pokemondb.net/boxes/black.jpg", status: true, inventory: 5, merchant: @merchant_2)
    end

    it "I see each Item that belongs to the Merchant with that merchant_id and all the Item's info" do
      visit "/merchants/#{@merchant_1.id}/items"
      expect(page).to_not have_content(@item_3.name)
      expect(page).to_not have_content(@item_4.name)

        expect(page).to have_content(@item_1.name)
        expect(page).to have_content(@item_1.price)
        expect(page).to have_content(@item_1.status)
        expect(page).to have_content(@item_1.inventory)
        expect(page).to have_css("img[src*='#{@item_1.image}']")


        expect(page).to have_content(@item_2.name)
        expect(page).to have_content(@item_2.price)
        expect(page).to have_content(@item_2.status)
        expect(page).to have_content(@item_2.inventory)
        expect(page).to have_css("img[src*='#{@item_2.image}']")

      visit "/merchants/#{@merchant_2.id}/items"

      expect(page).to_not have_content(@item_1.name)
      expect(page).to_not have_content(@item_2.name)

      expect(page).to have_content(@item_3.name)
      expect(page).to have_content(@item_3.price)
      expect(page).to have_content(@item_3.status)
      expect(page).to have_content(@item_3.inventory)
      expect(page).to have_css("img[src*='#{@item_3.image}']")

        expect(page).to have_content(@item_4.name)
        expect(page).to have_content(@item_4.price)
        expect(page).to have_content(@item_4.status)
        expect(page).to have_content(@item_4.inventory)
        expect(page).to have_css("img[src*='#{@item_4.image}']")

    end
  end
end

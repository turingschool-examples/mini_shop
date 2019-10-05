require 'rails_helper'

describe "user updates an item" do
  describe "they link from a show page" do
    describe "they fill in an edit form and submit" do
      it "displays the updated information on show page" do
        merchant_1 = Merchant.create!(name: "Thai Tanic", address: "410 Bleeker Street", city: "Philadelphia", state: "PA", zip: "19107" )
        item = merchant_1.items.create!(name: "Yam Talay", description: "Spicy Seafood Salad", price: 16.50, image: 'https://s3.amazonaws.com/finecooking.s3.tauntonclud.com/app/uploads/2017/04/18143140/fc87mc056-01-main.jpg', status: "inactive", inventory: 8)

        visit "items/#{item.id}"
        click_link "Update Item"

        expect(current_path).to eq("/items/#{item.id}/edit")

        fill_in "item[name]", with: "Yums Tulu"
        fill_in "item[description]", with: "Seafood Explosion"
        fill_in "item[price]", with: 20.00
        fill_in "item[image]", with: "http://static.asiawebdirect.com/m/.imaging/1356x904/website/bangkok/portals/bangkok-com/homepage/food-top10/allParagraphs/01/top10Set/00/image.jpg"
        fill_in "item[status]", with: "active"
        fill_in "item[inventory]", with: 12
        click_on "Submit"


        expect(page).to have_content("Yums Tulu")
        expect(page).to have_content("Seafood Explosion")
        expect(page).to have_content(20.00)
        expect(page.body).to include("http://static.asiawebdirect.com/m/.imaging/1356x904/website/bangkok/portals/bangkok-com/homepage/food-top10/allParagraphs/01/top10Set/00/image.jpg")
        expect(page).to have_content("active")
        expect(page).to have_content(12)
      end
    end
  end
end

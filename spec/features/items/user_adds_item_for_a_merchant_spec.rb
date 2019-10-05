require 'rails_helper'

describe "user creates new item for merchant" do
  describe "they link from merchant items index" do
    describe "they fill in the form information" do
      it "creates a new item" do
        merchant_1 = Merchant.create!(name: "Thai Tanic", address: "410 Bleeker Street", city: "Philadelphia", state: "PA", zip: "19107" )
        visit "/merchants/#{merchant_1.id}/items"
        click_link "Add New Item"

        expect(current_path).to eq("/merchants/#{merchant_1.id}/items/new")

        fill_in "item[name]", with: "Pad Thai"
        fill_in "item[description]", with: "Thai style fried noodles"
        fill_in "item[price]", with: 13.50
        fill_in "item[image]", with: "http://static.asiawebdirect.com/m/.imaging/1356x904/website/bangkok/portals/bangkok-com/homepage/food-top10/allParagraphs/01/top10Set/00/image.jpg"
        fill_in "item[status]", with: "active"
        fill_in "item[inventory]", with: 23

        click_on "Submit"
        
        expect(page).to have_content("Pad Thai")
        expect(page).to have_content("Thai style fried noodles")
        expect(page).to have_content(13.50)
        expect(page.body).to include("http://static.asiawebdirect.com/m/.imaging/1356x904/website/bangkok/portals/bangkok-com/homepage/food-top10/allParagraphs/01/top10Set/00/image.jpg")
        expect(page).to have_content("active")
        expect(page).to have_content(23)

      end
    end
  end
end

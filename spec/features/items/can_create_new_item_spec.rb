require 'rails_helper'
# User Story 10, Merchant Item Creation
#
# As a visitor
# When I visit a Merchant Items Index page
# Then I see a link to add a new item for that merchant
# When I click the link
# I am taken to '/merchants/:merchant_id/items/new' where I see a form to add a new item
# When I fill in the form with the item's:
# - name
# - price
# - description
# - image
# - inventory
# Then a `POST` request is sent to '/merchants/:merchant_id/items',
# a new item is created for that merchant,
# that item has a status of 'active',
# and I am redirected to the Merchant Items Index page where I see the new item
describe "When visiting merchants/:merchant_id/items" do
  describe "Can click a link that allows creation of new item" do
    describe "New item form is filled and submitted" do
      it "Creates the new item and takes you back to merchants/:merchant_id/items" do

        merchant_1 = Merchant.create(name: "Apple",
                                  address: "123 Greedy Ave",
                                     city: "Mountain View",
                                    state: "CA",
                                      zip: 90001)
        item_1 = Item.create(name: "Dress Shoes",
                      description: "Mens dress shoes",
                            price: 85,
                            image: "https://i.imgur.com/vNI9ncq.jpg",
                           status: true,
                        inventory: 75,
                        merchant_id: merchant_1.id )

        visit "/merchants/#{item_1.merchant_id}/items"
        click_link 'Add New Item'

        expect(current_path).to eq("/merchants/#{item_1.merchant_id}/items/new")

        fill_in "Name", with: "Watch"
        fill_in "Description", with: "Mens wrist watch"
        fill_in "Price", with: 110
        fill_in "Image", with: "https://i.imgur.com/owpKw1E.jpg"
        fill_in "Inventory", with: 50
        click_on 'Create Item'

        expect(current_path).to eq("/merchants/#{item_1.merchant_id}/items")

        save_and_open_page

        expect(page).to have_content("Apple")
        expect(page).to have_content("Watch")
        expect(page).to have_css("img[src*='https://i.imgur.com/owpKw1E.jpg']")
        expect(page).to have_content("Available")
        expect(page).to have_content(110)
        expect(page).to have_content(50)


      end
    end
  end
end

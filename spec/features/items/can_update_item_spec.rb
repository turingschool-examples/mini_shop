require 'rails_helper'
# When I visit an Item Show page
# Then I see a link to update that Item
# When I click the link
# I am taken to '/items/:id/edit' where I see a form to edit the item's data including:
# - name
# - price
# - description
# - image
# - inventory
# When I click the button to submit the form
# Then a `PATCH` request is sent to '/items/:id',
# the item's data is updated,
# and I am redirected to the Item Show page where I see the Item's updated information

describe "When viewing items' show page." do
  describe "Click link to edit item." do
    describe "Fill out and submit form to edit item." do
      it "Updates item and returns to show page." do
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
        visit "/items/#{item_1.id}"
        click_link 'Edit Item'

        expect(current_path).to eq("/items/#{item_1.id}/edit")

        fill_in "Name", with: "Watch"
        fill_in "Description", with: "Mens wrist watch"
        fill_in "Price", with: 110
        fill_in "Image", with: "https://i.imgur.com/owpKw1E.jpg"
        fill_in "Inventory", with: 50
        click_on "Submit Changes"

        expect(current_path).to eq("/items/#{item_1.id}")

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

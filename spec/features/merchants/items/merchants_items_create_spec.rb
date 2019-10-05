require 'rails_helper'

# a new item is created for that merchant,
# that item has a status of 'active',
# and I am redirected to the Merchant Items Index page where I see the new item

describe "Merchants items creation page" do
  describe "As a visitor" do
    it "can create a new item for a merchant" do

      merchant = Merchant.create!( name: "Chesters Collectables",
                                        address: "123 Fake St",
                                        city: "Awesomeville",
                                        state: "Montana",
                                        zip: 59001,
      )

      visit "/merchants/#{merchant.id}/items"

      click_link('Add Item')

      expect(current_path).to eq("/merchants/#{merchant.id}/items/new")

      fill_in('Name', with: 'Old Books')
      fill_in('Description', with: 'A collection of old scientific books for the scientific person')
      fill_in('Image', with: 'https://i.imgur.com/gV6wYt8.jpg')
      fill_in('Price', with: 2000)
      fill_in('Inventory', with: 3)
      click_button('submit')

      expect(current_path).to eq("/merchants/#{merchant.id}/items")
      expect(current_path).to have_content('Old Books')
      expect(current_path).to have_content('A collection of old scientific books for the scientific person')
      expect(current_path).to have_css("img[src*='https://i.imgur.com/LlHMnHG.jpg']")
      expect(current_path).to have_content(2000)
      expect(current_path).to have_content(3)
      expect(current_path).to have_content('Active')

    end
  end
end
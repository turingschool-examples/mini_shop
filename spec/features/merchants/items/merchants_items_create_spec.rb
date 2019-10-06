require 'rails_helper'

# a new item is created for that merchant,

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

      expect(page).to have_link('Item Index')
      expect(page).to have_link('Merchant Index')
      
      expect(page).to have_current_path("/merchants/#{merchant.id}/items/new")

      fill_in('Name', with: 'Old Books')
      fill_in('Description', with: 'A collection of old scientific books for the scientific person')
      fill_in('Image', with: 'https://i.imgur.com/gV6wYt8.jpg')
      fill_in('Price', with: 2000)
      fill_in('Inventory', with: 3)
      click_button('submit')

      expect(page).to have_current_path("/merchants/#{merchant.id}/items")
      expect(page).to have_link('Old Books')
      expect(page).to have_content('A collection of old scientific books for the scientific person')
      expect(page).to have_css("img[src*='https://i.imgur.com/gV6wYt8.jpg']")
      expect(page).to have_content(2000)
      expect(page).to have_content(3)
      expect(page).to have_content('Active')

    end
  end
end
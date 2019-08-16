require 'rails_helper'

describe 'User visits merchant items index page' do
  describe 'Then clicks link Add New Item and fills in form' do
    it 'Should create a new Item belonging to that Merchant' do
      bob = Merchant.create( name: 'Bob Ross Paints', address: '2345 Happy Tree Place', city: 'Boulder', state: 'CO', zip: '80303')
      title = "Bob Dog Shirt"
      description = "This gentle creature and Bob are kindred spirits."
      price = 19.00
      image = "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13000402/Bichon-Frise-On-White-03.jpg"
      inventory = 1000

      visit "merchants/#{bob.id}/items"
      click_link "Add New Item"

      expect(current_path).to eq("/merchants/#{bob.id}/items/new")

      fill_in :name, with: title
      fill_in :description, with: description
      fill_in :price, with: price
      fill_in :image, with: image
      fill_in :inventory, with: inventory
      click_on 'Add Item'

      expect(current_path).to eq("/merchants/#{bob.id}/items")

      expect(page).to have_content(title)
      expect(page).to have_content(price)
      expect(page).to have_content("Active")
      expect(page).to have_content(inventory)
    end
  end
end

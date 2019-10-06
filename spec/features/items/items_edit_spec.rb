require 'rails_helper'


describe "Item edit page" do
  describe "as a visitor" do
    it "can edit and item" do

      merchant = Merchant.create!( name: 'Chesters Collectables',
                                        address: '123 Fake St',
                                        city: 'Awesomeville',
                                        state: 'Montana',
                                        zip: 59001,

      )

      item = merchant.items.create!( name: 'Solid Gold Playing Cards',
                          description: 'One set of 52 solid gold playing cards.',
                          price: 1200,
                          image: 'https://i.imgur.com/LlHMnHG.jpg',
                          status: 'Active',
                          inventory: 2,
      )

      visit("/items/#{item.id}")

      click_link("Update Item")

      expect(page).to have_current_path("/items/#{item.id}/edit")

      fill_in('Name', with: 'Phonograph')
      fill_in('Description', with: 'To listen to all the latest tunes!')
      fill_in('Image', with: 'https://i.imgur.com/Fdypyzd.jpg')
      fill_in('Price', with: '1899')
      fill_in('Inventory', with: '3')
      click_button('submit')

      expect(page).to have_current_path("/items/#{item.id}")
      expect(page).to have_link('Phonograph')
      expect(page).to have_content('To listen to all the latest tunes!')
      expect(page).to have_css("img[src*='https://i.imgur.com/Fdypyzd.jpg']")
      expect(page).to have_content(1899)
      expect(page).to have_content(3)

    end
  end
end
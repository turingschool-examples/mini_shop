require 'rails_helper'


describe "Item edit page" do
  describe "as a visitor" do
    it "can edit an item" do

      chesters = Merchant.create!( name: 'Chesters Collectables',
                                        address: '123 Fake St',
                                        city: 'Awesomeville',
                                        state: 'Montana',
                                        zip: 59001,

      )

      item = chesters.items.create!( name: 'Solid Gold Playing Cards',
                          description: 'One set of 52 solid gold playing cards.',
                          price: 1200,
                          image: 'https://i.imgur.com/LlHMnHG.jpg',
                          status: 'Active',
                          inventory: 2,
      )

      visit("/items/#{item.id}")

      click_link("Update Item")

      expect(page).to have_current_path("/items/#{item.id}/edit")

      fill_in(:name, with: 'Globe')
      fill_in(:description, with: 'A globe to see the world!')
      fill_in(:image, with: 'https://i.imgur.com/Fdypyzd.jpg')
      fill_in :price, with: 999
      fill_in :inventory, with: 311
      click_button('submit')

      expect(current_path).to eq("/items/#{item.id}")
      # expect(page).to have_link('Globe')
      expect(page).to have_content('A globe to see the world!')
      expect(page).to have_css("img[src*='https://i.imgur.com/Fdypyzd.jpg']")
      expect(page).to have_content(999)
      expect(page).to have_content(311)

    end
  end
end
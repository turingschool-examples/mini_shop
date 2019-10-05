describe 'Merchant Item Creation' do
  describe 'As a visitor' do
    it 'I see a link to add a new item for that merchant' do
      hills_shop = Merchant.create(
        name: "Hills Shop",
        address: "not cool place",
        city: "denver",
        state: "colorado",
        zip: "80210"
      )
      visit "/merchants/#{hills_shop.id}/items"
      
      click_link 'Add Item'

      visit "/merchants/#{hills_shop.id}/items/new"

      fill_in "Name", with: "Red Prayer"
      fill_in "Price", with: "45"
      fill_in "Description", with: "v v cute"
      fill_in "Image", with: "https://bloomscape.com/wp-content/uploads/2019/03/bloomscape-product-red-prayer-plant-stone.jpg"
      fill_in "Inventory", with: "23"

      click_button "Create Item"

      expect(current_path).to eq("/merchants/#{hills_shop.id}/items")

      expect(page).to have_content("Red Prayer")
      expect(page).to have_content("45")
      expect(page).to have_content("v v cute")
      expect(page).to have_css("img[src*='https://bloomscape.com/wp-content/uploads/2019/03/bloomscape-product-red-prayer-plant-stone.jpg']")
      expect(page).to have_content("23")
    end
  end
end
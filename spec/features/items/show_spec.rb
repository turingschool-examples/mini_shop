require 'rails_helper'

describe 'Item Show Page' do
  describe 'As a User' do
    before(:each) do
      @chocolate_store = Merchant.create(name: 'The Candy Store', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80_233)
      @chocolate_bar = @chocolate_store.items.create!(name: 'Chocolate', description: 'It is chocolate', price: 3, image: 'https://previews.123rf.com/images/tashka2000/tashka20001104/tashka2000110400002/9286183-slices-of-chocolate-bar-isolated-on-white-background.jpg', inventory: 15)
    end

    it 'I see the stats for an item with a specific id' do
      visit item_path(@chocolate_bar)

      expect(page).to have_content(@chocolate_bar.name)
      expect(page).to have_content(@chocolate_bar.description)
      expect(page).to have_content(@chocolate_bar.price)
      expect(page).to have_content(@chocolate_bar.inventory)
    end

    it 'I see a link to update that Item' do
      visit item_path(@chocolate_bar)
      click_link 'Edit Item'
      expect(current_path).to eq("/items/#{@chocolate_bar.id}/edit")

      name = 'Better Chocolate Bar'
      description = 'Now 50% More Chocolate'

      fill_in 'Name', with: name
      fill_in 'Description', with: description
      click_button 'Update Item'

      expect(current_path).to eq("/items/#{@chocolate_bar.id}")

      expect(page).to have_content('Better Chocolate Bar')
      expect(page).to have_content('Now 50% More Chocolate')
    end

    it 'I see a link to delete the item' do
      visit item_path(@chocolate_bar)
      click_link 'Delete Item'
      expect(current_path).to eq('/items')
      expect(page).to_not have_content(@chocolate_bar.name)
      expect(page).to_not have_content(@chocolate_bar.description)
    end

    it 'I see a link to change the Items active status' do
      visit item_path(@chocolate_bar)

      expect(page).to have_content('Item is Active')
      click_link 'Deactivate Item'

      expect(current_path).to eq("/items/#{@chocolate_bar.id}")
      expect(page).to have_content('Item is Inactive')
      click_link 'Activate Item'

      expect(current_path).to eq("/items/#{@chocolate_bar.id}")
      expect(page).to have_content('Item is Active')
    end
  end
end

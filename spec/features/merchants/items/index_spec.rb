require 'rails_helper'

describe 'Merchants Items Index Page' do
  describe 'As a User' do
    before(:each) do
      @chocolate_store = Merchant.create(name: 'The Candy Store', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80_233)
      @caramel_store = Merchant.create(name: 'The Candy Store', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80_233)
      @chocolate_bar = @chocolate_store.items.create!(name: 'Chocolate', description: 'It is chocolate', price: 3, image: 'https://previews.123rf.com/images/tashka2000/tashka20001104/tashka2000110400002/9286183-slices-of-chocolate-bar-isolated-on-white-background.jpg', inventory: 15)
      @chocolate_bar2 = @chocolate_store.items.create!(name: 'Chocolate2', description: 'It is chocolate too', price: 5, image: 'https://previews.123rf.com/images/tashka2000/tashka20001104/tashka2000110400002/9286183-slices-of-chocolate-bar-isolated-on-white-background.jpg', inventory: 10, active?: false)
      @caramel_bar = @caramel_store.items.create!(name: 'Caramel', description: 'It is caramel', price: 25, image: 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/12/11/0/VP0104H_Caramels_s4x3.jpg.rend.hgtvcom.826.620.suffix/1513028933152.jpeg', inventory: 10)
    end

    it 'I see each Item in the system and the item information' do
      visit merchant_items_path(@chocolate_store)

      expect(page).to have_content(@chocolate_bar.name)
      expect(page).to have_content(@chocolate_bar.price)
      expect(page).to have_content(@chocolate_bar.inventory)

      expect(page).to_not have_content(@caramel_bar.name)
    end

    it 'I see a link to add a new item for that merchant' do
      visit merchant_items_path(@chocolate_store)
      click_link 'New Item'
      expect(current_path).to eq("/merchants/#{@chocolate_store.id}/items/new")

      name = 'New Chocolate Bar'
      price = 5
      description = 'Better Chocolate'
      image = 'image'
      inventory = 12

      fill_in 'Name', with: name
      fill_in 'Price', with: price
      fill_in 'Description', with: description
      fill_in 'Image', with: image
      fill_in 'Inventory', with: inventory
      click_button 'Create Item'

      new_bar = Item.last

      expect(current_path).to eq("/merchants/#{@chocolate_store.id}/items")
      expect(page).to have_content(new_bar.name)
      expect(page).to have_content(new_bar.price)
      expect(page).to have_content(new_bar.description)
      expect(page).to have_content(new_bar.inventory)
    end

    xit 'I see a link to show only active items' do
      visit merchant_items_path(@chocolate_store)
      click_link 'Active Items'
      expect(current_path).to eq("/merchants/#{@chocolate_store.id}/items?active=true")
      expect(page).to have_content(@chocolate_bar.name)
      expect(page).to_not have_content(@chocolate_bar2.name)
    end

    xit 'I see a link to show only inactive items' do
      visit merchant_items_path(@chocolate_store)
      click_link 'Inactive Items'
      expect(current_path).to eq("/merchants/#{@chocolate_store.id}/items?active=false")
      expect(page).to have_content(@chocolate_bar2.name)
      expect(page).to_not have_content(@chocolate_bar.name)
    end
  end
end

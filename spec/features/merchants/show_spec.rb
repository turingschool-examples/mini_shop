require 'rails_helper'

describe 'Merchant Show Page' do
  describe 'As a User' do
    before :each do
      @candy_store = Merchant.create(name: 'The Candy Store', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80_233)
      @chocolate_bar = @candy_store.items.create!(name: 'Chocolate', description: 'It is chocolate', price: 3, image: 'https://previews.123rf.com/images/tashka2000/tashka20001104/tashka2000110400002/9286183-slices-of-chocolate-bar-isolated-on-white-background.jpg', inventory: 15)
      @caramel_bar = @candy_store.items.create!(name: 'Caramel', description: 'It is caramel', price: 2, image: 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/12/11/0/VP0104H_Caramels_s4x3.jpg.rend.hgtvcom.826.620.suffix/1513028933152.jpeg', inventory: 10)
    end

    it 'I see the merchant stats by their id' do
      visit merchant_path(@candy_store)

      expect(page).to have_content(@candy_store.name)
      expect(page).to have_content(@candy_store.address)
      expect(page).to have_content(@candy_store.city)
      expect(page).to have_content(@candy_store.state)
      expect(page).to have_content(@candy_store.zip)
    end

    it 'I see a link to update the merchant' do
      visit merchant_path(@candy_store)

      click_link 'Edit Merchant'

      expect(current_path).to eq("/merchants/#{@candy_store.id}/edit")

      address = '821 Park Place'
      city = 'Golden'

      fill_in 'Address', with: address
      fill_in 'City', with: city
      click_button 'Update Merchant'

      expect(current_path).to eq("/merchants/#{@candy_store.id}")

      expect(page).to have_content('821 Park Place')
      expect(page).to have_content('Golden')
    end

    it 'I see a link to delete the merchant' do
      visit merchant_path(@candy_store)

      click_link 'Delete Merchant'

      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content(@candy_store.name)
    end

    it 'I see a link to all the merchant items' do
      visit merchant_path(@candy_store)
      click_link "All #{@candy_store.name} Items"
      expect(current_path).to eq("/merchants/#{@candy_store.id}/items")
      expect(page).to have_content(@chocolate_bar.name)
      expect(page).to have_content(@caramel_bar.name)
    end
  end
end

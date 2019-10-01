require 'rails_helper'

describe 'Merchants Items Index Page' do
  describe 'As a User' do
    before(:each) do
      @chocolate_store = Merchant.create(name: 'The Candy Store', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80_233)
      @caramel_store = Merchant.create(name: 'The Candy Store', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80_233)
      @chocolate_bar = @chocolate_store.items.create!(name: 'Chocolate', description: 'It is chocolate', price: 3, image: 'https://previews.123rf.com/images/tashka2000/tashka20001104/tashka2000110400002/9286183-slices-of-chocolate-bar-isolated-on-white-background.jpg', active?: true, inventory: 15, merchant_name: @chocolate_store.name)
      @caramel_bar = @caramel_store.items.create!(name: 'Caramel', description: 'It is caramel', price: 2, image: 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/12/11/0/VP0104H_Caramels_s4x3.jpg.rend.hgtvcom.826.620.suffix/1513028933152.jpeg', active?: true, inventory: 10, merchant_name: @caramel_store.name)
  end

    it 'I see each Item in the system and the item information' do
      visit "/merchants/#{@chocolate_store.id}/items"

      expect(page).to have_content(@chocolate_bar.price)
      expect(page).to have_content(@chocolate_bar.active?)
      expect(page).to have_content(@chocolate_bar.inventory)

      expect(page).to_not have_content(@caramel_bar.price)
      expect(page).to_not have_content(@caramel_bar.inventory)
    end
  end
end

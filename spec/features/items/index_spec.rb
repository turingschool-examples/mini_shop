require 'rails_helper'

describe 'Item Index Page' do
  describe 'As a User' do
    before(:each) do
      @candy_store = Merchant.create(name: 'The Candy Store', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80_233)
      @chocolate_bar = @candy_store.items.create!(name: 'Chocolate', description: 'It is chocolate', price: 3, image: 'https://previews.123rf.com/images/tashka2000/tashka20001104/tashka2000110400002/9286183-slices-of-chocolate-bar-isolated-on-white-background.jpg', active?: true, inventory: 15, merchant_name: @candy_store.name)
      @caramel_bar = @candy_store.items.create!(name: 'Caramel', description: 'It is caramel', price: 2, image: 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/12/11/0/VP0104H_Caramels_s4x3.jpg.rend.hgtvcom.826.620.suffix/1513028933152.jpeg', active?: true, inventory: 10, merchant_name: @candy_store.name)
    end

    it 'I see each Item in the system and the item information' do
      visit '/items'

      expect(page).to have_content(@chocolate_bar.name)
      expect(page).to have_content(@chocolate_bar.description)
      expect(page).to have_content(@chocolate_bar.price)
      expect(page).to have_content(@chocolate_bar.image)
      expect(page).to have_content(@chocolate_bar.active?)
      expect(page).to have_content(@chocolate_bar.inventory)
      expect(page).to have_content(@chocolate_bar.merchant_name)

      expect(page).to have_content(@caramel_bar.name)
      expect(page).to have_content(@caramel_bar.description)
      expect(page).to have_content(@caramel_bar.price)
      expect(page).to have_content(@caramel_bar.image)
      expect(page).to have_content(@caramel_bar.active?)
      expect(page).to have_content(@caramel_bar.inventory)
      expect(page).to have_content(@caramel_bar.merchant_name)
    end
  end
end

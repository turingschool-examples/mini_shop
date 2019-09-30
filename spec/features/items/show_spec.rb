require 'rails_helper'

describe 'Item Show Page' do
  describe 'As a User' do
    before(:each) do
      @chocolate_store = Merchant.create(name: 'The Candy Store', address: '123 Main Street', city: 'Denver', state: 'CO', zip: 80_233)
      @chocolate_bar = @chocolate_store.items.create!(name: 'Chocolate', description: 'It is chocolate', price: 3, image: 'https://previews.123rf.com/images/tashka2000/tashka20001104/tashka2000110400002/9286183-slices-of-chocolate-bar-isolated-on-white-background.jpg', active?: true, inventory: 15, merchant_name: @chocolate_store.name)
    end

    it 'I see the stats for an item with a specific id' do
      visit "/items/#{@chocolate_bar.id}"

      expect(page).to have_content(@chocolate_bar.name)
      expect(page).to have_content(@chocolate_bar.description)
      expect(page).to have_content(@chocolate_bar.price)
      expect(page).to have_content(@chocolate_bar.active?)
      expect(page).to have_content(@chocolate_bar.inventory)
      expect(page).to have_content(@chocolate_bar.merchant_name)
    end
  end
end

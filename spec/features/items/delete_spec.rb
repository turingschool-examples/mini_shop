require 'rails_helper'

RSpec.describe 'Items Delete page', type: :feature do
  describe 'a user visits an item page' do
    before(:each) do
      @merchant = Merchant.create!(name: 'Bob', address: '400 W 10th', city: 'Denver', state: 'CO', zip: '80204')
      @item = @merchant.items.create!(name: 'iPhone', description: 'A phone', price: 999.99, image: 'iphone.jpg', active: true, inventory: 1000)
    end

    it 'user clicks to delete the item' do
      visit item_path(@item)

      click_button "Delete"

      expect(current_path).to eq(items_path)

      expect(page).to_not have_content(@merchant.name)
      expect(page).to_not have_content(@item.name)
    end
  end
end

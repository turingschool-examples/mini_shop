require 'rails_helper'

RSpec.describe 'Items Edit page', type: :feature do
  describe 'when a user visits an item show page' do
    before(:each) do
      @merchant = Merchant.create!(name: 'Bob', address: '400 W 10th', city: 'Denver', state: 'CO', zip: '80204')
      @item = @merchant.items.create!(name: 'iPhone', description: 'A phone', price: 999.99, image: 'iphone.jpg', active: true, inventory: 1000)
    end

    it 'user clicks to edit the item details' do
      visit item_path(@item)

      click_link "Edit"

      expect(current_path).to eq(edit_item_path(@item))
      within(".title") { expect(page).to have_content("Edit Item") }
      expect(find_field(:name).value).to eq(@item.name)
      expect(find_field(:description).value).to eq(@item.description)
      expect(find_field(:price).value).to eq(@item.price.to_s)
      expect(find_field(:image).value).to eq(@item.image)
      expect(find_field(:active).value).to eq(@item.active.to_s)
      expect(find_field(:inventory).value).to eq(@item.inventory.to_s)

      fill_in :name, with: "Zebra"
      fill_in :price, with: 42
      click_on "Submit"

      expect(current_path).to eq(item_path(@item))
      within('.title') { expect(page).to have_content("Zebra") }
      within('#description') { expect(page).to have_content(@item.description) }
      within('#price') { expect(page).to have_content(42) }
      within('#image') { expect(page).to have_content(@item.image) }
      within('#active') { expect(page).to have_content(@item.active) }
      within('#inventory') { expect(page).to have_content(@item.inventory) }
    end

    it 'user can see nav bar' do
      visit edit_item_path(@item)

      within('.nav') do
        expect(page).to have_button("Merchants")
        expect(page).to have_button("Items")
      end
    end
  end
end

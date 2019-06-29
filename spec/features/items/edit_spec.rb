require 'rails_helper'

RSpec.describe 'Update Item' do
  describe 'As a visitor' do
    describe 'When I visit an item show page' do
      it 'I can update an item' do

        merchant = Merchant.create!(name: "She Sells Seashells", address: "1234 Market St", city: "Denver", state: "CO", zipcode: "80220")
        item = Item.create!(name: "Necklace", description: "Shell on chain", price: 30, image: "file_path", active_status: true, inventory: 3, merchant_id: merchant.id)

        visit item_path(item)

        click_link 'Update Item'

        expect(current_path).to eq(edit_item_path(item))

        fill_in :price, with: 35

        click_on "Submit Update"

        expect(current_path).to eq(item_path(item))
        expect(page).to have_content(35)
      end
    end
  end
end

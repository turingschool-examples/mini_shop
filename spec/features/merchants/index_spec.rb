require 'rails_helper'

RSpec.describe 'merchants index page', type: :feature do
  describe 'when a user visits the index page' do
    it 'user can see all merchants' do
      merchant_1 = Merchant.create!(name: 'Bob', address: '400 W 10th', city: 'Denver', state: 'CO', zip: '80204')
      merchant_2 = Merchant.create!(name: 'Roy', address: '601 W 11th', city: 'Chicago', state: 'IL', zip: '50291')

      visit merchants_path

      within('.title') { expect(page).to have_content("All Merchants") }
      within("#merchant-#{merchant_1.id}") do
        expect(page).to have_link(merchant_1.name)
      end
      within("#merchant-#{merchant_2.id}") do
        expect(page).to have_link(merchant_2.name)
      end
    end

    it 'user can see new merchant link' do
      visit merchants_path

      within('.bottom_link') do
        expect(page).to have_button('New Merchant')
      end
    end

    it 'user can see nav bar' do
      visit merchants_path

      within('.nav') do
        expect(page).to have_button('Merchants')
        expect(page).to have_button('Items')

        click_on 'Merchants'

        expect(current_path).to eq(merchants_path)
      end
    end

    it 'user can see nav bar' do
      visit merchants_path

      within('.nav') do
        expect(page).to have_button("Merchants")
        expect(page).to have_button("Items")

        click_on "Items"

        expect(current_path).to eq(items_path)
      end
    end
  end
end

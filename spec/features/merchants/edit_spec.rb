require 'rails_helper'

RSpec.describe 'merchants edit page', type: :feature do
  describe 'when a user visits a merchant page' do
    before(:each) do
      @merchant = Merchant.create!(name: 'Jon', address: '200 E 10th', city: 'Denver', state: 'CO', zip: '80204')
    end

    it 'user clicks to edit the merchant details' do
      visit merchant_path(@merchant)

      click_button "Edit"

      expect(current_path).to eq(edit_merchant_path(@merchant))
      within(".title") { expect(page).to have_content("Edit Merchant") }
      expect(find_field(:name).value).to eq(@merchant.name)
      expect(find_field(:address).value).to eq(@merchant.address)
      expect(find_field(:city).value).to eq(@merchant.city)
      expect(find_field(:state).value).to eq(@merchant.state)
      expect(find_field(:zip).value).to eq(@merchant.zip)

      fill_in :name, with: "Jonathan"
      fill_in :zip, with: "80222"
      click_on "Submit"

      expect(current_path).to eq(merchant_path(@merchant))
      within('.title') { expect(page).to have_content("Jonathan") }
      within('#address') { expect(page).to have_content(@merchant.address) }
      within('#city') { expect(page).to have_content(@merchant.city) }
      within('#state') { expect(page).to have_content(@merchant.state) }
      within('#zip') { expect(page).to have_content("80222") }
    end

    it 'user can see nav bar' do
      visit edit_merchant_path(@merchant)

      within('.nav-1') do
        expect(page).to have_button("Merchants")
        expect(page).to have_button("Items")

        click_on "Merchants"

        expect(current_path).to eq(merchants_path)
      end
    end

    it 'user can see nav bar' do
      visit edit_merchant_path(@merchant)

      within('.nav-1') do
        expect(page).to have_button("Merchants")
        expect(page).to have_button("Items")

        click_on "Items"

        expect(current_path).to eq(items_path)
      end
    end
  end
end

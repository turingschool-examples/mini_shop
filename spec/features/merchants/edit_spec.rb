require 'rails_helper'

RSpec.describe 'Update Merchant' do
  describe 'As a visitor' do
    describe 'When I visit the merchants show page' do
      it 'I can update a merchant' do

        merchant_1 = Merchant.create(name: "She Sells Seashells", address: "1234 Market St", city: "Denver", state: "CO", zipcode: "80220")

        visit merchant_path(merchant_1)

        click_link 'Update Merchant'

        expect(current_path).to eq(edit_merchant_path(merchant_1))

        fill_in :address, with: "3543 Market St"

        click_on "Submit Update"

        expect(current_path).to eq(merchant_path(merchant_1))
        expect(page).to have_content("3543 Market St")
      end
    end
  end
end

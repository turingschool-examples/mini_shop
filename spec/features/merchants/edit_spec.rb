require 'rails_helper'

RSpec.describe 'Update Merchant' do
  describe 'As a visitor' do
    describe 'When I visit the merchants show page' do
      it 'I can update a merchant' do
        merchant_1 = Merchant.create(name: "She Sells Seashells", address: "1234 Market St", city: "Denver", state: "CO", zipcode: "80220")

        visit "/merchants/#{merchant_1.id}"

        click_link 'Update Merchant'

        expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")

        # fill_in 'Name', with: 'The Beatles'
        click_on 'Submit Update'

        expect(current_path).to eq("/merchants/#{merchant_1.id}")
        expect(page).to have_content(merchant_1.name)
      end
    end
  end
end

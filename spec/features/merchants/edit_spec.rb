require 'rails_helper'

RSpec.describe 'Update Merchant' do
  describe 'As a visitor' do
    describe 'When I visit the Update merchant form by clicking a link on the index' do
      it 'I can update a merchant' do
        merchant_1 = Merchant.create(name: "Moosejaw",
                                     address: "4321 Bob Street",
                                     city: "Denver",
                                     state: "Colorado",
                                     zip: "55555")
        visit "/merchants/#{merchant_1.id}"

        click_button 'Edit'

        expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")

        fill_in 'Name',    with: 'REI'
        fill_in 'Address', with: '1234 Smith Street'
        fill_in 'City',    with: 'Boulder'
        fill_in 'State',   with: 'Colorado'
        fill_in 'zip',     with: '80303'
        click_on 'Update Merchant'

        expect(current_path).to eq("/merchants/#{merchant_1.id}")
        expect(page).to have_content('REI')
        expect(page).to have_content('1234 Smith Street')
        expect(page).to have_content('Boulder')
        expect(page).to have_content('Colorado')
        expect(page).to have_content('80303')
      end
    end
  end
end
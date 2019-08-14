require 'rails_helper'

describe 'User visits a merchant show page' do
  describe 'They see and click a link to update the merchant' do
    describe 'They fill out a form to update the merchant' do
      it 'Updates the merchant' do
        merchant = Merchant.create( name: 'Bob Ross Paints',
                                    address: '2345 Happy Tree Place',
                                    city: 'Boulder',
                                    state: 'CO',
                                    zip: '80303')
        visit "/merchants/#{merchant.id}"
        click_link 'Edit Merchant Info'

        expect(current_path).to eq("/merchants/#{merchant.id}/edit")

        fill_in :name, with: 'Bob Ross Paints'
        fill_in :address, with: '3456 Lonely Cloud Road'
        fill_in :city, with: 'Petaluma'
        fill_in :state, with: 'CA'
        fill_in :zip, with: '94000'
        click_on 'Submit'

        expect(current_path).to eq("/merchants/#{merchant.id}")

        expect(page).to have_content('Bob Ross Paints')
        expect(page).to have_content('Address: 3456 Lonely Cloud Road')
        expect(page).to have_content('City: Petaluma')
        expect(page).to have_content('State: CA')
        expect(page).to have_content('Zip Code: 9400')
        expect(page).to have_link('Edit Merchant Info')
      end
    end
  end
end

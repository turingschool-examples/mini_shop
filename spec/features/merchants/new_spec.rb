require 'rails_helper'

RSpec.describe 'New Merchant' do
  describe 'As a visitor' do
    describe 'When I visit the merchant index page' do
      it 'I will see a link to create a new merchant' do
        visit '/merchants'

        click_link 'New Merchant'

        expect(current_path).to eq('/merchants/new')

        fill_in 'name', with: 'Pita Pan'
        fill_in 'address', with: 'Neverland'
        fill_in 'city', with: 'Neverland'
        fill_in 'state', with: 'Forever Young'
        fill_in 'zip', with: 1904

        click_on 'Create Merchant'

        expect(current_path).to eq('/merchants')
        expect(page).to have_content('Name: Pita Pan')
        # expect(page).to have_content('Address', 'Neverland')
        # expect(page).to have_content('City: Neverland')
        # expect(page).to have_content('State: Forever Young')
        # expect(page).to have_content('zip': 1904)
      end
    end
  end
end

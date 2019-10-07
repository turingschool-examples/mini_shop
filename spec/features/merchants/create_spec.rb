require 'rails_helper'

RSpec.describe 'New Merchant' do
  describe 'As a visitor' do
    describe 'When I visit the new merchant form by clicking a link on the index' do
      it 'I can create a new merchant' do
        visit '/merchants'

        click_link 'New Merchant'

        expect(current_path).to eq('/merchants/new')

        fill_in 'Name',    with: 'REI'
        fill_in 'Address', with: '1234 Smith Street'
        fill_in 'City',    with: 'Boulder'
        fill_in 'State',   with: 'Colorado'
        fill_in 'zip',     with: '80303'
        click_on 'Create Merchant'

        expect(current_path).to eq('/merchants')
        expect(page).to have_content('REI')
      end
    end
  end
end
require 'rails_helper'

describe 'User creates new merchant' do
  describe 'They link from the merchants page' do
    describe 'They fill in the form' do
      it 'Creates a new merchant' do

        visit '/merchants'
        click_link 'Add Merchant'

        expect(current_path).to eq('/merchants/new')

        fill_in 'merchant[name]', with: 'Crunchy Hippy'
        fill_in 'merchant[address]', with: 'Haight Street'
        fill_in 'merchant[city]', with: 'San Francisco'
        fill_in 'merchant[state]', with: 'CA'
        fill_in 'merchant[zip]', with: '94125'

        click_on 'Submit'
        expect(page).to have_link('Crunchy Hippy')
      end
    end
  end
end

require 'rails_helper'

describe 'User creates new merchant' do
  describe 'They link from the merchants page' do
    describe 'They fill in the form' do
      it 'Creates a new merchant' do

        visit '/merchants'
        click_link 'Add Merchant'

        expect(current_path).to eq('/merchants/new')

        fill_in :name, with: 'Crunchy Hippy'
        fill_in :address, with: '420 Haight Street'
        fill_in :city, with: 'San Francisco'
        fill_in :state, with: 'CA'
        fill_in :zip, with: '94125'

        click_on 'Submit'
        expect(page).to have_link('Crunchy Hippy')
      end
    end
  end
end

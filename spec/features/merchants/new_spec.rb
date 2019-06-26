# require 'rails_helper'
#
RSpec.describe 'New Merchant' do
  describe 'As a visitor' do
    describe 'When I visit the new merchant form' do
      it 'I can create a new merchant' do
        visit '/merchants'

        click_link 'New Merchant'

        expect(current_path).to eq('/merchants/new')

        fill_in 'Name', with: 'Jeffrey'
        click_on 'Create Merchant'

        expect(current_path).to eq("/merchants")
        expect(page).to have_content('Jeffrey')
      end
    end
  end
end

# As a visitor
# When I visit a merchant show page
# Then I see a link to update the merchant
# When I click the link
# Then I am taken to '/merchants/:id/edit' where I  see a form to edit the merchant's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/merchants/:id',
# the merchant's info is updated,
# and I am redirected to the Merchant's Show page where I see the merchant's updated info
require 'rails_helper'

describe '#update merchant page', type: :feature do
  before :each do
    @corina = Merchant.create(name: 'Corina', address: '342 Lima St', city: 'Aurora', state: 'CO', zip: 80012)
  end

  describe 'when clicking on Update Merchant'
    it 'opens page with update form' do
      visit "/merchants/#{@corina.id}"

      click_on 'Update Merchant'

      expect(current_path).to eq("/merchants/#{@corina.id}/update")

      fill_in :name, with: 'Corina'
      fill_in :address, with: '1488 S Kenton St'
      fill_in :city, with: 'Aurora'
      fill_in :state, with: 'CO'
      fill_in :zip, with: 80012

      click_on 'Update Merchant'

      expect(current_path).to eq("/merchants/#{@corina.id}")
      expect(page).to have_content('Corina')
      expect(page).to have_content('1488 S Kenton St')
      expect(page).to have_content('Aurora')
      expect(page).to have_content('CO')
      expect(page).to have_content(80012)
  end
end

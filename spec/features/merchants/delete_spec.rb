# As a visitor
# When I visit a merchant show page
# Then I see a link to delete the merchant
# When I click the link
# Then a 'DELETE' request is sent to '/merchants/:id',
# the merchant is deleted,
# and I am redirected to the merchant index page where I no longer see this merchant
require 'rails_helper'

describe '#delete merchant', type: :feature do
  before :each do
    @corina = Merchant.create(name: 'Corina', address: '342 Lima St', city: 'Aurora', state: 'CO', zip: 80012)
  end

  describe 'when viewing merchant show page'
    it 'has a delete link' do
      visit "/merchants/#{@corina.id}"

      expect(page).to have_link('Delete Merchant')
    end

    it 'clicking on delete removes merchant' do
      visit "/merchants/#{@corina.id}"
      
      click_on 'Delete Merchant'

      expect(current_path).to eq('/merchants')
      expect(page).not_to have_content(@corina.name)
    end
end

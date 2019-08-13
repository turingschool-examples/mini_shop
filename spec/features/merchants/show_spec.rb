require 'rails_helper'

describe 'user views one merchant,' do
  describe 'they click on the merchant link,' do
    it 'displays that merchant info' do
      merchant = Merchant.create( name: 'Bob Ross Paints',
                                    address: '2345 Happy Tree Place',
                                    city: 'Boulder',
                                    state: 'CO',
                                    zip: '80303')

      visit '/merchants'
      click_link merchant.name

      expect(page).to have_content("#{merchant.name}")
      expect(page).to have_content("Address: #{merchant.address}")
      expect(page).to have_content("City: #{merchant.city}")
      expect(page).to have_content("State: #{merchant.state}")
      expect(page).to have_content("Zip Code: #{merchant.zip}")
    end
  end
end

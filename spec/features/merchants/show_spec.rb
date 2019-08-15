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

describe 'merchant show page', type: :feature do
  before :each do
    @merchant_1 = Merchant.create(name: 'Some Store', address: '123 Merchant Lane', city: 'Spend City', state: 'NY', zip: 00011)
  end

  it 'show merchant details' do
    visit "/merchants/#{@merchant_1.id}"

    expect(page).to have_content(@merchant_1.name)
    expect(page).to have_content(@merchant_1.address)
    expect(page).to have_content(@merchant_1.city)
    expect(page).to have_content(@merchant_1.state)
    expect(page).to have_content(@merchant_1.zip)
  end
end

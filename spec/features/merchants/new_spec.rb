# As a visitor
# When I visit the Merchant Index page
# Then I see a link to create a new merchant
# When I click this link
# Then I am taken to '/merchants/new' where I  see a form for a new merchant
# When I fill out the form with a new merchant's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button to submit the form
# Then a `POST` request is sent to '/merchants',
# a new merchant is created,
# and I am redirected to the Merchant Index page where I see the new Merchant listed.

require 'rails_helper'

RSpec.describe 'Create a new merchant', type: :feature do
  it 'has a link on the index page to a new merchant form' do
    visit '/merchants'

    # save_and_open_page
    click_link 'New Merchant'

    expect(current_path).to eq('/merchants/new')

    fill_in :name, with: 'Some Store'
    fill_in :address, with: '123 Merchant Lane'
    fill_in :city, with: 'Denver'
    fill_in :state, with: 'CO'
    fill_in :zip, with: 80012

    click_on 'Create Merchant'
    expect(current_path).to eq('/merchants')
    new_merchant = Merchant.last
    expect(page).to have_content('Some Store')
  end
end

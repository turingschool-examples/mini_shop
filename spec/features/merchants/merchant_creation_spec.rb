require 'rails_helper'

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

RSpec.describe "merchant creation", type: :feature do

  it "can see link to create merchant from index" do
    visit '/merchants'

    expect(page).to have_link("Create a new merchant")
  end

  it "can use link to redirect to create merchant page" do
    visit '/merchants'
    click_link "Create a new merchant"

    expect(current_path).to eq('/merchants/new')
    expect(page).to have_content('Name')
    expect(page).to have_content('Address')
    expect(page).to have_content('City')
    expect(page).to have_content('State')
    expect(page).to have_content('Zip Code')
    expect(page).to have_button('Create Merchant')
  end

  it "can fill out and submit form" do
    visit '/merchants/new'
    fill_in 'merchant[name]', with: 'Once and Floral'
    fill_in 'merchant[address]', with: '852 Picadilly Lane'
    fill_in 'merchant[city]', with: 'Greensville'
    fill_in 'merchant[state]', with: 'SC'
    fill_in 'merchant[zip]', with: '28352'
    click_button 'Create Merchant'

    # Test new merchant is created
    expect(current_path).to eq('/merchants')
    expect(page).to have_content('Once and Floral')
  end

end

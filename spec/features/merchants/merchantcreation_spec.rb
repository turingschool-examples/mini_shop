require "rails_helper"

RSpec.describe "merchants index page", type: :feature do

  it "user can make new merchant" do

    visit "/merchants"

    click_on "New Merchant"


    fill_in 'Name', with: 'Billy'
    fill_in 'Address', with: '123 Ya moms house Circle'
    fill_in 'City', with: 'Chicago'
    fill_in 'State', with: 'Illinois'
    fill_in 'Zip', with: '78047'


    click_on "Create Merchant"

    expect(current_path).to eq("/merchants")


    merch_1 = Merchant.last

    expect(page).to have_content(merch_1.name)

  end
end



# User Story 3, Merchant Creation
#
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

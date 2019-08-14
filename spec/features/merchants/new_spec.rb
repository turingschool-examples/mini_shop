require "rails_helper"
# User Story 4, Merchant Creation
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
describe "merchant creation page" do
  it "has a form with merchant information" do
    visit "/merchants/new"

    fill_in :name, with: "Test name"
    fill_in :address, with: "Test address"
    fill_in :city, with: "Test city"
    fill_in :state, with: "Test state"
    fill_in :zip, with: 12345

    click_button "Submit"

    expect(current_path).to eq('/merchants')

    expect(page).to have_content("Test name")

  end

end

require 'rails_helper'

RSpec.describe "on merchant show page", type: :feature do
  it "user can update a merchant's info" do
#     As a visitor
# When I visit a merchant show page
    merchant_1 = Merchant.create( name: "Corner Store",
                                  address: "234 Yarp Dr.",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80211")
    visit "/merchants/#{merchant_1.id}"
    save_and_open_page
    expect(page).to have_link("Edit Merchant Information",
                              href: "/merchants/#{merchant_1.id}/edit")
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
  end
end

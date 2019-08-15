require "rails_helper"

describe "Merchant Show Page" do

  it 'shows merchant info' do
    merchant = Merchant.create!(name: "Moose Munchies", address: "306 Meese Ave", city: "Moose Jaw", state: "MO", zip: "50400")
    # As a visitor
    # When I visit '/merchants/:id'
    visit "/merchants/#{merchant.id}"
    # Then I see the merchant with that id including the merchant's:
    # - name
    # - address
    # - city
    # - state
    # - zip
    expect(page).to have_content("Moose Munchies")
    expect(page).to have_content("306 Meese Ave")
    expect(page).to have_content("Moose Jaw")
    expect(page).to have_content("MO")
    expect(page).to have_content("50400")
  end
end

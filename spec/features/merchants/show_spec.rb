require "rails_helper"

describe "Merchant Show Page" do

  it 'shows merchant info' do
    merchant = Merchant.create!(name: "Moose Munchies", address: "306 Meese Ave", city: "Moose Jaw", state: "MO", zip: "50400")

    visit "/merchants/#{merchant.id}"

    expect(page).to have_content("Moose Munchies")
    expect(page).to have_content("306 Meese Ave")
    expect(page).to have_content("Moose Jaw")
    expect(page).to have_content("MO")
    expect(page).to have_content("50400")
  end

  it 'updates merchant info' do
    merchant = Merchant.create!(name: "Moose Munchies", address: "306 Meese Ave", city: "Moose Jaw", state: "MO", zip: "50400")

    visit "/merchants/#{merchant.id}"
    expect(page).to have_link("Update Merchant")

    click_link "Update Merchant"
    expect(current_path).to eq("/merchants/#{merchant.id}/edit")
  end

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

require "rails_helper"


describe "merchant show page" do
  it "shows the merchant info" do
    merchant_1 = Merchant.create!(name: "Football Frenzy", address: "123 14th Circle", city: "Frederick", state: "CO", zip: 80530)

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_1.address)
    expect(page).to have_content(merchant_1.city)
    expect(page).to have_content(merchant_1.state)
    expect(page).to have_content(merchant_1.zip)
  end

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

  it "has a link to to update merchant info" do
    merchant_1 = Merchant.create!(name: "Football Frenzy", address: "123 14th Circle", city: "Frederick", state: "CO", zip: 80530)

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_link("Update Merchant")

    click_link "Update Merchant"

    expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")
  end
end

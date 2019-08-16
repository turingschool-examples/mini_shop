require "rails_helper"

describe "Merchant Edit Page" do
  it "has a form to update merchant information" do
    merchant_1 = Merchant.create!(name: "Football Frenzy", address: "123 14th Circle", city: "Frederick", state: "CO", zip: 80530)

    visit "/merchants/#{merchant_1.id}/edit"

    expect(page).to have_content("Merchant name:")
    expect(page).to have_content("Merchant address:")
    expect(page).to have_content("Merchant city:")
    expect(page).to have_content("Merchant state:")
    expect(page).to have_content("Merchant zip code:")

    fill_in :name, with: "Test name update"
    fill_in :address, with: "Test address update"
    fill_in :city, with: "Test city update"
    fill_in :state, with: "Test state update"
    fill_in :zip, with: 23456

    click_button "Submit"

    expect(current_path).to eq("/merchants/#{merchant_1.id}")

    expect(page).to have_content("Test name update")
    expect(page).to have_content("Test address update")
    expect(page).to have_content("Test city update")
    expect(page).to have_content("Test state update")
    expect(page).to have_content(23456)
  end
end

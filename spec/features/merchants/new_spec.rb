require "rails_helper"

describe "merchant creation page" do
  it "has a form to fill in with merchant information" do
    visit "/merchants/new"

    expect(page).to have_content("Merchant name:")
    expect(page).to have_content("Merchant address:")
    expect(page).to have_content("Merchant city:")
    expect(page).to have_content("Merchant state:")
    expect(page).to have_content("Merchant zip code:")

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

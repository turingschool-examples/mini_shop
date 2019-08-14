require "rails_helper"

describe "merchant creation page" do
  it "has a form with merchant information" do
    visit "/merchants/new"

    expect(page).to have_content("Merchant name:")
    expect(page).to have_content("Merchant address:")
    expect(page).to have_content("Merchant city:")
    expect(page).to have_content("Merchant state:")
    expect(page).to have_content("Merchant zip code:")
  end

end

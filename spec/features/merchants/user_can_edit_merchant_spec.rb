require 'rails_helper'

RSpec.describe "merchant update", type: :feature do
  it "can click edit" do
    merchant_1 = Merchant.create(name: "David's shop",
                                  address: "1234 Broadway St",
                                  city: "Denver",
                                  state: "Colorado",
                                  zip: "80203")

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_link("Edit")

    click_link "Edit"

    expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")
  end

  it "can edit merchant" do
    merchant_1 = Merchant.create(name: "David's shop",
                                  address: "1234 Broadway St",
                                  city: "Denver",
                                  state: "Colorado",
                                  zip: "80203")

    visit "/merchants/#{merchant_1.id}/edit"

    expect(page).to have_field("Name")
    expect(page).to have_field("Address")
    expect(page).to have_field("City")
    expect(page).to have_field("State")
    expect(page).to have_field("Zip")

    fill_in 'Name', with: "Eddy's Stuff"
    fill_in 'Address', with: "1134 Washington St"
    fill_in 'City', with: "Denver"
    fill_in 'State', with: "Colorado"
    fill_in 'Zip', with: "83490"

    click_button 'Submit'

    expect(current_path).to eq("/merchants/#{merchant_1.id}")

    expect(page).to have_content("Eddy's Stuff")
    expect(page).to have_content("1134 Washington St")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Colorado")
    expect(page).to have_content("83490")
  end
end

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

    name = "Poutine Parlour"
    address = "514 Maple Syrup Dr"
    city = "Montreal"
    state = "MI"
    zip = "47262"

    fill_in "Name", with: name
    fill_in "Address", with: address
    fill_in "City", with: city
    fill_in "State", with: state
    fill_in "Zip", with: zip

    click_on "Update Merchant"

    expect(current_path).to eq("/merchants/#{merchant.id}")
    expect(page).to have_content("514 Maple Syrup Dr")
  end
end

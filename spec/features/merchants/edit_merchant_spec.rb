require 'rails_helper'

RSpec.describe "editing a merchant", type: :feature do
  it "can click a link to edit an existing merchant" do
    merchant_1 = Merchant.create(name: "Doug's Donuts", address: "123 Fried Dough Drive", city: "Portland", state: "OR", zip: 12345)

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_link("Edit")

    click_link "Edit"

    expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")
  end

  it "can edit an existing merchant" do
    merchant_1 = Merchant.create(name: "Doug's Donuts", address: "123 Fried Dough Drive", city: "Portland", state: "OR", zip: 12345)

    visit "/merchants/#{merchant_1.id}/edit"

    expect(page).to have_field("merchant[name]")
    expect(page).to have_field("merchant[address]")
    expect(page).to have_field("merchant[city]")
    expect(page).to have_field("merchant[state]")
    expect(page).to have_field("merchant[zip]")

    fill_in 'merchant[name]', with: "Gary's Goats"
    fill_in 'merchant[address]', with: '4572 Bleat Boulevard'
    fill_in 'merchant[city]', with: 'New Haven'
    fill_in 'merchant[state]', with: 'CT'
    fill_in 'merchant[zip]', with: 97345

    click_button "Submit"

    expect(current_path).to eq("/merchants/#{merchant_1.id}")

    expect(page).to have_content("Gary's Goats")
    expect(page).to have_content("4572 Bleat Boulevard")
    expect(page).to have_content("New Haven")
    expect(page).to have_content("CT")
    expect(page).to have_content(97345)
  end
end

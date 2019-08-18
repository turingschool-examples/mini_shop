require "rails_helper"

RSpec.describe "merchant edit page", type: :feature do
  it "can edit a merchant's information" do
    merchant_1 = Merchant.create!(name: "Stuff n' Things", address: "123 North St", city: "Denver", zip: 80203, state: "CO")

    visit "/merchants/#{merchant_1.id}"

    click_link "Edit"

    expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")

    fill_in :name, with: "Things n' Stuff"

    click_on 'Update Merchant'

    expect(current_path).to eq("/merchants/#{merchant_1.id}")
    expect(page).to have_content("Things n' Stuff")
  end
end

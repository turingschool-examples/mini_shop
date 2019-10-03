require 'rails_helper'

RSpec.describe "merchants index page", type: :feature do
  it "merchants page has link to create a new merchant" do

    visit "/merchants"
    expect(page).to have_link("Create New Merchant", href: '/merchants/new')
  end
    # When I click this link
  it "goes to make new merchant page" do
    visit "/merchants"
    click_link "Create New Merchant"
    # Then I am taken to '/merchants/new'
    expect(current_path).to eq("/merchants/new")
  end
end
# where I  see a form for a new merchant
describe "new merchant page", type: :feature do
  it "has a form to make a new merchant" do
    visit "/merchants/new"
    expect(page).to have_field(:merchant_name)
    expect(page).to have_field(:merchant_address)
    expect(page).to have_field(:merchant_city)
    expect(page).to have_field(:merchant_state)
    expect(page).to have_field(:merchant_zip)
  end

describe "when I fill out a new merchant form", type: :feature do
  it "sents a POST request to /merchants" do
    visit "/merchants/new"
    fill_in :merchant_name, with: "Forever More Store"
    fill_in :merchant_address, with:"903 Whatever Dr."
    fill_in :merchant_city, with: "Santa Fe"
    fill_in :merchant_state, with: "NM"
    fill_in :merchant_zip, with: "87501"

    click_on "Create Merchant"
    expect(current_path).to eq("/merchants")
    expect(page).to have_content("Forever More Store")
    expect(Merchant.last.address).to eq("903 Whatever Dr.")
    expect(Merchant.last.city).to eq("Santa Fe")
    expect(Merchant.last.state).to eq("NM")
    expect(Merchant.last.zip).to eq("87501")

  end
end
end

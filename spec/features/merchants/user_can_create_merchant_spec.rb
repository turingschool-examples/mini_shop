require 'rails_helper'

RSpec.describe "merchants index page", type: :feature do
  it "goes to make new merchant page" do
    visit "/merchants"
    click_link "Create New Merchant"
    expect(current_path).to eq("/merchants/new")
  end
end

describe "new merchant page", type: :feature do
  it "has a form to make a new merchant" do
    visit "/merchants/new"
    expect(page).to have_field(:name)
    expect(page).to have_field(:address)
    expect(page).to have_field(:city)
    expect(page).to have_field(:state)
    expect(page).to have_field(:zip)
  end

describe "when I fill out a new merchant form", type: :feature do
  it "sents a POST request to /merchants" do
    visit "/merchants/new"
    fill_in :name, with: "Forever More Store"
    fill_in :address, with:"903 Whatever Dr."
    fill_in :city, with: "Santa Fe"
    fill_in :state, with: "NM"
    fill_in :zip, with: "87501"

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

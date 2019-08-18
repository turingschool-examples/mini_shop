require 'rails_helper'

RSpec.describe "Creating a new merchant" do
  it "has a link on the index page to a new merchant form" do
    visit '/merchants'

    expect(page).to have_link("Add New Merchant")

    click_on "Add New Merchant"

    expect(current_path).to eq('/merchants/new')

    fill_in :name, with: "Mark"
    fill_in :address, with: "4628 E 23rd Ave"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: 80207

    click_on "Create Merchant"

    new_merchant = Merchant.last

    expect(current_path).to eq("/merchants")
    expect(page).to have_link(new_merchant.name)
  end
end

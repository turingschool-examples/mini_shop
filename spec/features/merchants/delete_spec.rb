require 'rails_helper'

RSpec.describe "Deleting a new merchant" do
  it "has a link on the merchant page to delete the merchant" do
    merchant_1 = Merchant.create!(name: "Cecilia Chapman", address: "711-2880 Nulla St.", city: "Mankato", state: "MS", zip: 96522)

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_link("Delete")

    click_on "Delete"

    expect(current_path).to eq("/merchants")
  end
end

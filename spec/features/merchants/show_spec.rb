require "rails_helper"

RSpec.describe "merchants show page", type: :feature do
  it "visitor can see the merchant with given id with its attributes" do
    merchant = Merchant.create(name: "Nancy", address: "17th Blake St", city: "Denver", state: "CO", zip: 80202)

    visit "/merchants/#{merchant.id}"

    expect(page).to have_content(merchant.name)
    expect(page).to have_content(merchant.address)
    expect(page).to have_content(merchant.city)
    expect(page).to have_content(merchant.state)
    expect(page).to have_content(merchant.zip)
  end
end

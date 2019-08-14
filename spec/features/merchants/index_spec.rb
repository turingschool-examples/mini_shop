require "rails_helper"

RSpec.describe "merchant index page" do
  it "shows all merchants" do
    merchant_1 = Merchant.create(name: "Football Frenzy", address: "123 14th Circle", city: "Frederick", state: "CO", zip: 80530)
    merchant_2 = Merchant.create(name: "Gridiron Gear", address: "456 East Drive", city: "Longmont", state: "CO", zip: 80501)

    visit "/merchants"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
  end
end

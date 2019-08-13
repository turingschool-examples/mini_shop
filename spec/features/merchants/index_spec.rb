require "rails_helper"

RSpec.describe "merchant index page" do
  it "shows all merchants" do
    merchant_1 = Merchant.create(name: "Fred-mart", address: "123 Fred Circle", city: "Frederick", state: "CO", zip: 80530)
    merchant_2 = Merchant.create(name: "Lonnie's", address: "456 Lonnie Drive", city: "Longmont", state: "CO", zip: 80501)

    visit "/merchants"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
  end
end

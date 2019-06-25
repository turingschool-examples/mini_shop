require "rails_helper"

RSpec.describe "merchants index page", type:
:feature do
  it "user can see all merchant names" do
    merchant_1 = Merchant.create(name: "Thai Tanic")
    merchant_2 = Merchant.create(name: "Lord Of The Rinse")
    merchant_3 = Merchant.create(name: "Pita Pan")

    visit "/merchants"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
    expect(page).to have_content(merchant_3.name)
  end
end

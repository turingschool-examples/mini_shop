require "rails_helper"

RSpec.describe "merchant index page", type: :feature do
  it "visit can see all merchants" do
    merchant_1 = Merchant.create(name: "Nancy")
    merchant_2 = Merchant.create(name: "Mack")

    visit"/merchants"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
  end
end

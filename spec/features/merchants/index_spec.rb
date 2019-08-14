require "rails_helper"

RSpec.describe "merchants index page", type: :feature do
  it "visitor can see all merchants" do
    merchant_1 = Merchant.create(name: "Nancy")
    merchant_2 = Merchant.create(name: "Mack")
    merchant_3 = Merchant.create(name: "Corina")
    merchant_4 = Merchant.create(name: "Leiya")
    merchant_5 = Merchant.create(name: "Evette")

    visit "/merchants"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
  end
end

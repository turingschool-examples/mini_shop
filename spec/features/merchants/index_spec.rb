require "rails_helper"

RSpec.describe "merchants index page", type: :feature do
  it "user can see all merchants" do
    merchant_1 = Merchant.create(name: "Banana Bazaar")
    merchant_2 = Merchant.create(name: "Cherry Corner")

    visit "/merchants"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
  end
end

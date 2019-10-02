require 'rails_helper'

RSpec.describe "merchants index page", type: :feature do
  it "can see the name of each merchant in the system" do
    merchant_1 = Merchant.create(name: "Oomba")
    merchant_2 = Merchant.create(name: "Kozmo")

  visit "/merchants"

  expect(page).to have_content(merchant_1.name)
  expect(page).to have_content(merchant_2.name)
  end
end

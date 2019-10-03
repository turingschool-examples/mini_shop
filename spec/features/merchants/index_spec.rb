require 'rails_helper'

describe "Merchant index page" do
  it "shows all merchants" do
    merchant_1 = Merchant.create(name:"scott", address:"4942 willow", city:"denver", state: "co", zip:"90210")
    merchant_2 = Merchant.create(name:"david", address:"4942 willow", city:"denver", state: "co", zip:"90210")
    merchant_3 = Merchant.create(name:"ryan", address:"4942 willow", city:"denver", state: "co", zip:"90210")
    visit "/merchants"
    # save_and_open_page uncomment me to use launchy
    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
    expect(page).to have_content(merchant_3.name)
  end
end

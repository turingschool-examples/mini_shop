require "rails_helper"

RSpec.describe "Merchant Index Page", type: :feature do
  it "user can see all merchants" do

    merchant_1 = Merchant.create(name: "Merchant 1", address: "address1", city: "city1", state: "state1", zip:"zip1")
    merchant_2 = Merchant.create(name: "Merchant 2", address: "address2", city: "city2", state: "state2", zip:"zip2")
      visit '/merchants'
     expect(page).to have_content(merchant_1.name)
     expect(page).to have_content(merchant_2.name)
 end
end

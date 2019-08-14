require "rails_helper"

RSpec.describe "Merchant Index Page", type: :feature do
  it "user can see all merchants" do

      merchant_1 = Merchant.create(name: "Merchant 1")
      merchant_2 = Merchant.create(name: "Merchant 2")

      visit '/merchants'

     expect(page).to have_content(merchant_1.name)
     expect(page).to have_content(merchant_2.name)
 end
end

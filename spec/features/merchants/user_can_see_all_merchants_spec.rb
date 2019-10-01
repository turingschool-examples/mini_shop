require 'rails_helper'

RSpec.describe "merchants index page", type: :feature do
  it "can see all merchants" do
    merchant_1 = Merchant.create( name: "Corner Store",
                                  address: "234 Yarp Dr.",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80211")
    merchant_2 = Merchant.create( name: "Store Store",
                                  address: "567 Narp Dr.",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80203")
    merchant_3 = Merchant.create( name: "Your More Store",
                                  address: "890 Aardvark Dr.",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80201")

    visit "/merchants"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
    expect(page).to have_content(merchant_3.name)
  end
end

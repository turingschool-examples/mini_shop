require 'rails_helper'

RSpec.describe "Merchant Index Page", type: :feature do
  it "Can see all Merchants names" do
    merchant_1 = Merchant.create(name: "Apple",
                              address: "123 Greedy Ave",
                                 city: "Mountain View",
                                state: "CA",
                                  zip: 90001)
    merchant_2 = Merchant.create(name: "Google",
                              address: "456 Greedy Ave",
                                 city: "Mountain View",
                                state: "CA",
                                  zip: 90002)
    merchant_3 = Merchant.create(name: "Twitter",
                              address: "789 Greedy Ave",
                                   city: "Mountain View",
                                  state: "CA",
                                    zip: 90003)

    visit "/merchants"
    save_and_open_page

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
    expect(page).to have_content(merchant_3.name)
  end
end

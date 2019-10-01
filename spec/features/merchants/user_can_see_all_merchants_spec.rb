require 'rails_helper'

RSpec.describe "merchants index page", type: :feature do
  it "can see all merchant names in the index" do
    merchant_1 = Merchant.create(name: "REI",
                                 address: "1234 Smith Street",
                                 city: "Boulder",
                                 state: "Colorado",
                                 zip: "80303")
    merchant_2 = Merchant.create(name: "Moosejaw",
                                 address: "4321 Bob Street",
                                 city: "Denver",
                                 state: "Colorado",
                                 zip: "55555")
    
    visit '/merchants'

    save_and_open_page

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
  end
end
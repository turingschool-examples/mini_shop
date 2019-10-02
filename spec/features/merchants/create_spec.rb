require 'rails_helper'

RSpec.describe "individual create a merchant", type: :feature do
  it "can create a new merchant on the new page" do
    merchant_1 = Merchant.create(name: "REI",
                                 address: "1234 Smith Street",
                                 city: "Boulder",
                                 state: "Colorado",
                                 zip: "80303")

    visit "/merchants/new"
  end
end
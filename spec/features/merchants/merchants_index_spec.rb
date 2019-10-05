require 'rails_helper'

describe "merchants index page", type: :feature do
  it "can see all merchants" do

    merchant_1 = Merchant.create( name: "Chesters Collectables",
                                  address: "123 Fake St",
                                  city: "Awesomeville",
                                  state: "Montana",
                                  zip: 59001,
    )

    merchant_2 = Merchant.create( name: "Monty's Mercantile",
                                  address: "456 Main St",
                                  city: "Townsville",
                                  state: "Colorado",
                                  zip: 12345,
    )

    merchant_3 = Merchant.create( name: "Georgios Goods",
                                  address: "303 Madeup Rd",
                                  city: "Faketon",
                                  state: "Tennessee",
                                  zip: 37010,
    )

    visit('/merchants/')

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
    expect(page).to have_content(merchant_3.name)

  end
end
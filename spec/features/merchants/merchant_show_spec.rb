require 'rails_helper'

describe "merchant show page", type: :feature do
  it "can see that ids merchant's name, address, city, state, zip" do

    merchant = Merchant.create( name: "Chesters Collectables",
                                  address: "123 Fake St",
                                  city: "Awesomeville",
                                  state: "Montana",
                                  zip: 59001,
    )

    visit "merchants/#{merchant.id}"

    expect(page).to have_content(merchant.name)
    expect(page).to have_content(merchant.address)
    expect(page).to have_content(merchant.city)
    expect(page).to have_content(merchant.state)
    expect(page).to have_content(merchant.zip)

  end
end
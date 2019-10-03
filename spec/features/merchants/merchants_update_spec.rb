require 'rails_helper'

describe "merchant update page", type: :feature do
  before :each do
    @merchant_1 = Merchant.create( name: "Chesters Collectables",
                                  address: "123 Fake St",
                                  city: "Awesomeville",
                                  state: "Montana",
                                  zip: 59001,
    )
    @merchant_2 = Merchant.create( name: "Spots Spot",
                                  address: "8888 Underwater Blvd",
                                  city: "Atlanta",
                                  state: "Atlantis",
                                  zip: 11111,
    )
  end

  it "can update a new merchant with a name, address, city, state, zip" do
    visit "/merchants/#{@merchant_1.id}"
    click_link('Edit')
    fill_in 'merchant[name]', with: '@merchant_2.name'
    fill_in('merchant[address]', :with => '@merchant_2.address')
    fill_in 'merchant[city]', with: '@merchant_2.city'
    fill_in 'merchant[state]', with: '@merchant_2.state'
    fill_in 'merchant[zip]', with: @merchant_2.zip
    click_button('submit')
  end

  it "shows the updated merchant on the index page after creation" do
    visit "merchants"
    expect(page).to have_content(@merchant_2.name)
  end

  it "shows the merchants info on the merchants page after creation" do
    visit "merchants/#{@merchant_2.id}"
    expect(page).to have_content(@merchant_2.name)
    expect(page).to have_content(@merchant_2.address)
    expect(page).to have_content(@merchant_2.city)
    expect(page).to have_content(@merchant_2.state)
    expect(page).to have_content(@merchant_2.zip)
  end

end
require 'rails_helper'

describe "merchant create page", type: :feature do
  before :each do
    @merchant = Merchant.create( name: "Chesters Collectables",
                                  address: "123 Fake St",
                                  city: "Awesomeville",
                                  state: "Montana",
                                  zip: 59001,
    )
  end

  it "can create a new merchant with a name, address, city, state, zip" do
    visit '/merchants'
    click_link('Create New Merchant')
    expect(current_path).to eql('/merchants/new')
    fill_in 'merchant[name]', with: '@merchant.name'
    fill_in('merchant[address]', :with => '@merchant.address')
    fill_in 'merchant[city]', with: '@merchant.city'
    fill_in 'merchant[state]', with: '@merchant.state'
    fill_in 'merchant[zip]', with: @merchant.zip
    click_button('submit')
    expect(current_path).to eql('/merchants')
  end

  it "shows the merchant on the index page after creation" do
    visit "merchants"
    expect(page).to have_content(@merchant.name)
  end

  it "shows the merchants info on the merchants page after creation" do
    visit "merchants/#{@merchant.id}"
    expect(page).to have_content(@merchant.name)
    expect(page).to have_content(@merchant.address)
    expect(page).to have_content(@merchant.city)
    expect(page).to have_content(@merchant.state)
    expect(page).to have_content(@merchant.zip)
  end

end
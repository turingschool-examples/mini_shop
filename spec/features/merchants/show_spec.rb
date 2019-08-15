require "rails_helper"

describe "merchants show page" do
  before :each do
    @merchant = Merchant.create(name: "Moose Munchies")
  end

  it "should show all merchants" do

    # As a visitor
    # When I visit '/merchants/:id'
    visit "/merchants/#{@merchant.id}"
    # Then I see the merchant with that id including the merchant's:
    # - name
    # - address
    # - city
    # - state
    # - zip
    expect(page).to have_content(@merchant.name)
    expect(page).to have_content(@merchant.address)
    expect(page).to have_content(@merchant.city)
    expect(page).to have_content(@merchant.state)
    expect(page).to have_content(@merchant.zip)
  end
end

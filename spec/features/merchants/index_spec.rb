require "rails_helper"

describe "Merchants Index Page" do
  before :each do
    @moose = Merchant.create(name: "Moose Munchies", address: "306 Meese Ave", city: "Moose Jaw", state: "MO", zip: "50400")
    @ehplus = Merchant.create(name: "Eh Plus School Supplies")
    @twofour = Merchant.create(name: "Two-Four Liquors")
  end

  it "lists all merchants" do
    moose = Merchant.create(name: "Moose Munchies", address: "306 Meese Ave", city: "Moose Jaw", state: "MO", zip: "50400")
    ehplus = Merchant.create(name: "Eh Plus School Supplies")
    twofour = Merchant.create(name: "Two-Four Liquors")

    # As a visitor
    # When I visit '/merchants'
    visit '/merchants'
    # Then I see the name of each merchant in the system
    expect(page).to have_content(moose.name)
    expect(page).to have_content(ehplus.name)
    expect(page).to have_content(twofour.name)
  end
end

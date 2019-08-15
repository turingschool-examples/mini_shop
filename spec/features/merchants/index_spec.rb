require "rails_helper"

describe "merchants index page" do
  before :each do
    @moose = Merchant.create(name: "Moose Munchies")
    @ehplus = Merchant.create(name: "Eh Plus School Supplies")
    @twofour = Merchant.create(name: "Two-Four Liquors")
  end

  it "should show all merchants" do

    # As a visitor
    # When I visit '/merchants'
    visit '/merchants'
    # Then I see the name of each merchant in the system
    expect(page).to have_content(@moose.name)
    expect(page).to have_content(@ehplus.name)
    expect(page).to have_content(@twofour.name)
  end
end

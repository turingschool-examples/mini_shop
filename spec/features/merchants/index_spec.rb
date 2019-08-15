require "rails_helper"

describe "Merchants Index Page" do
  before :each do
    @moose = Merchant.create(name: "Moose Munchies", address: "306 Meese Ave", city: "Moose Jaw", state: "MO", zip: "50400")
    @ehplus = Merchant.create(name: "Eh Plus School Supplies", address: "123 ABC St", city: "Elbow", state: "ND", zip: "50410")
    @twofour = Merchant.create(name: "Two-Four Liquors", address: "416 Mickey Rd", city: "Punkeydoodles Corners", state: "NY", zip: "48186")

  end

  it "lists all merchants" do

    visit '/merchants'
    expect(page).to have_content(@moose.name)
    expect(page).to have_content(@ehplus.name)
    expect(page).to have_content(@twofour.name)
  end

  it "creates a new merchant" do

    visit '/merchants'
    expect(page).to have_link("Create Merchant")

    click_link "Create Merchant"
    expect(current_path).to eq("/merchants/new")

    name = "Poutine Parlour"
    address = "514 Tabarnak Dr"
    city = "Montreal"
    state = "MI"
    zip = "47262"

    fill_in "Name", with: name
    fill_in "Address", with: address
    fill_in "City", with: city
    fill_in "State", with: state
    fill_in "Zip", with: zip

    click_on "Create Merchant"

    expect(current_path).to eq("/merchants")
    expect(page).to have_content("Poutine Parlour")
  end

end

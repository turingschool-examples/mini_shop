require 'rails_helper'

RSpec.describe "merchants index page", type: :feature do
  it "merchants page has link to create a new merchant" do

    visit "/merchants"
    expect(page).to have_link("Create New Merchant", href: '/merchants/new')
  end
    # When I click this link
  it "goes to make new merchant page" do
    visit "/merchants"
    click_link "Create New Merchant"
    # Then I am taken to '/merchants/new'
    expect(current_path).to eq("/merchants/new")
  end
end
# where I  see a form for a new merchant
describe "new merchant page", type: :feature do
  it "has a form to make a new merchant" do
    visit "/merchants/new"
    expect(page).to have_field(:name)
    expect(page).to have_field(:address)
    expect(page).to have_field(:city)
    expect(page).to have_field(:state)
    expect(page).to have_field(:zip)
  end

describe "when I fill out a new merchant form", type: :feature do
  it "sents a POST request to /merchants" do
    visit "/merchants/new"
    fill_in "merchant[name]", with: "Forever More Store"
    fill_in "merchant[address]", with: "903 Whatever Dr."
    fill_in "merchant[city]", with: "Santa Fe"
    fill_in "merchant[state]", with: "NM"
    fill_in "merchant[zip]", with: "87501"
    click_on "submit"

    expect(current_path).to eq("/merchants")
  end
end
    # When I fill out the form with a new merchant's:
    # - name
    # - address
    # - city
    # - state
    # - zip
    # And I click the button to submit the form
    # Then a `POST` request is sent to '/merchants',

    # a new merchant is created,

    # and I am redirected to the Merchant Index page where I see the new Merchant listed.
end

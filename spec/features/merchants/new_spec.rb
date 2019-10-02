require 'rails_helper'

RSpec.describe "Navigates to a new merchant page", type: :feature do
  it "can navigate to the new page" do

    visit "/merchants/new"

    expect(page).to have_content("New Merchant")
    expect(page).to have_field("merchant[name]")
    expect(page).to have_field("merchant[address]")
    expect(page).to have_field("merchant[city]")
    expect(page).to have_field("merchant[state]")
    expect(page).to have_field("merchant[zip]")
  end
end
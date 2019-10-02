require 'rails_helper'

RSpec.describe "Navigates to a new merchant page", type: :feature do
  it "can navigate to the new page" do

    visit "/merchants/new"

    expect(page).to have_content("New Merchant")
    expect(page).to have_field("Name")
    expect(page).to have_field("Address")
    expect(page).to have_field("City")
    expect(page).to have_field("State")
    expect(page).to have_field("Zip")
  end
end
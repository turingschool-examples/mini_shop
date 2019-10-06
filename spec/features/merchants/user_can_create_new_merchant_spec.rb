require 'rails_helper'

RSpec.describe "create new merchant", type: :feature do
  it "can create new merchant link" do

    visit "/merchants"

    expect(page).to have_link("Create New Merchant")

    click_link "Create New Merchant"

    expect(current_path).to eq('/merchants/new')
  end

  it "can create a new merchant" do

    visit "/merchants/new"

    fill_in 'Name', with: "Paul's Pizza"
    fill_in 'Address', with: "789 Washington St"
    fill_in 'City', with: "Denver"
    fill_in 'State', with: "Colorado"
    fill_in 'Zip', with: "83490"

    click_button 'Submit'

    expect(current_path).to eq('/merchants')

    expect(page).to have_content("Paul's Pizza")
    expect(Merchant.last.name).to eq("Paul's Pizza")
    expect(Merchant.last.address).to eq("789 Washington St")
  end
end

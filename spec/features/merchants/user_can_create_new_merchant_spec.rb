require 'rails_helper'

RSpec.describe "create new merchant" do
    it "can create new merchant link" do

    visit "/merchants"

    expect(page).to have_link("Create New Merchant")

    click_link "Create New Merchant"

    expect(current_path).to eq('/merchants/new')
  end

  it "can create a new merchant" do

    visit "/merchants/new"

    expect(page).to have_field("merchant[name]")
    expect(page).to have_field("merchant[address]")
    expect(page).to have_field("merchant[city]")
    expect(page).to have_field("merchant[state]")
    expect(page).to have_field("merchant[zip]")

    fill_in 'merchant[name]', with: "Paul's Pizza"
    fill_in 'merchant[address]', with: "789 Washington St"
    fill_in 'merchant[city]', with: "Denver"
    fill_in 'merchant[state]', with: "Colorado"
    fill_in 'merchant[zip]', with: "83490"

    click_button 'Submit'

    expect(current_path).to eq('/merchants')

    expect(page).to have_content("Paul's Pizza")

  end
end

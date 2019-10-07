require 'rails_helper'

RSpec.describe "creating a merchant", type: :feature do
  it "create a new merchant" do
    visit "/merchants"

    expect(page).to have_link("Create New Merchant")

    click_link "Create New Merchant"

    expect(current_path).to eq('/merchants/new')

    fill_in 'Name', with: "Doug's Donuts"
    fill_in 'Address', with: '123 Fried Dough Drive'
    fill_in 'City', with: 'Portland'
    fill_in 'State', with: 'OR'
    fill_in 'Zip', with: 12345

    click_button 'Submit'

    expect(current_path).to eq('/merchants')

    expect(page).to have_content("Doug's Donuts")
  end
end

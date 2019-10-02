require 'rails_helper'

RSpec.describe "creating a merchant", type: :feature do
  it "can click a link to create a new merchant" do
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

    fill_in 'merchant[name]', with: "Doug's Donuts"
    fill_in 'merchant[address]', with: '123 Fried Dough Drive'
    fill_in 'merchant[city]', with: 'Portland'
    fill_in 'merchant[state]', with: 'OR'
    fill_in 'merchant[zip]', with: 12345

    click_button 'Submit'

    expect(current_path).to eq('/merchants')

    expect(page).to have_content("Doug's Donuts")
  end
end

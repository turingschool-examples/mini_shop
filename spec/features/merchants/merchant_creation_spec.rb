require 'rails_helper'

RSpec.describe "merchant creation", type: :feature do

  it "can see link to create merchant from index" do
    visit '/merchants'

    expect(page).to have_link("Create a new merchant")
  end

  it "can use link to redirect to create merchant page" do
    visit '/merchants'
    click_link "Create a new merchant"

    expect(current_path).to eq('/merchants/new')
    expect(page).to have_content('Name')
    expect(page).to have_content('Address')
    expect(page).to have_content('City')
    expect(page).to have_content('State')
    expect(page).to have_content('Zip Code')
    expect(page).to have_button('Create Merchant')
  end

  it "can fill out and submit form" do
    visit '/merchants/new'
    fill_in 'merchant[name]', with: 'Once and Floral'
    fill_in 'merchant[address]', with: '852 Picadilly Lane'
    fill_in 'merchant[city]', with: 'Greensville'
    fill_in 'merchant[state]', with: 'SC'
    fill_in 'merchant[zip]', with: '28352'
    click_button 'Create Merchant'

    expect(current_path).to eq('/merchants')
    expect(page).to have_content('Once and Floral')
  end

end

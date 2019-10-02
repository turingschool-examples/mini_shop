require 'rails_helper'

RSpec.describe "merchant update", type: :feature do

  before :each do
    @merchant = Merchant.create(
      name: 'Back to the Fuscia',
      address: '1862 W Starlight Road',
      city: 'Frankfurt',
      state: 'KY',
      zip: 23671
    )
  end

  it "can see link to update merchant from show page" do
    visit "/merchants/#{@merchant.id}"

    expect(page).to have_link('Update this merchant')
  end

  it "can use link to redirect to edit merchant page" do
    visit "/merchants/#{@merchant.id}"
    click_link 'Update this merchant'

    expect(current_path).to eq("/merchants/#{@merchant.id}/edit")
    expect(page).to have_content('Name')
    expect(page).to have_content('Address')
    expect(page).to have_content('City')
    expect(page).to have_content('State')
    expect(page).to have_content('Zip Code')
    expect(page).to have_button('Update Merchant')
  end

  it "can fill out and submit form" do
    visit "/merchants/#{@merchant.id}/edit"
    fill_in 'merchant[name]', with: 'Once and Floral'
    fill_in 'merchant[address]', with: '852 Picadilly Lane'
    fill_in 'merchant[city]', with: 'Greensville'
    fill_in 'merchant[state]', with: 'SC'
    fill_in 'merchant[zip]', with: '28352'
    click_button 'Update Merchant'

    expect(current_path).to eq("/merchants/#{@merchant.id}")
    expect(page).to have_content('Once and Floral')
    expect(page).to have_content('Address: 852 Picadilly Lane')
    expect(page).to have_content('City: Greensville')
    expect(page).to have_content('State: SC')
    expect(page).to have_content('Zip Code: 28352')
  end

end

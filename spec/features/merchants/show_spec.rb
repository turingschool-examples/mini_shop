require 'rails_helper'

RSpec.describe "merchants show page", type: :feature do

  before :each do
    @merchant = Merchant.create(
      name: 'Once and Floral',
      address: '76 Poinsetta Street',
      city: 'Johnstown',
      state: 'AK',
      zip: 94591
    )
  end

  it "can see name address city state zip" do
    visit "/merchants/#{@merchant.id}"

    expect(page).to have_content(@merchant.name)
    expect(page).to have_content("Address: #{@merchant.address}")
    expect(page).to have_content("City: #{@merchant.city}")
    expect(page).to have_content("State: #{@merchant.state}")
    expect(page).to have_content("Zip Code: #{@merchant.zip}")
  end

  it "can click on items sold to redirect to merchant items index" do
    visit "/merchants/#{@merchant.id}"
    expect(page).to have_link('Items Sold')

    click_link 'Items Sold'
    expect(current_path).to eq("/merchants/#{@merchant.id}/items")
  end

end

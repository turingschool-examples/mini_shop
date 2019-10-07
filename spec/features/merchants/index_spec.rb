require 'rails_helper'

RSpec.describe "merchants index page", type: :feature do

  before :each do
    @merchant_1 = Merchant.create(
      name: 'Back to the Fuscia',
      address: '1862 W Starlight Road',
      city: 'Frankfurt',
      state: 'KY',
      zip: 23671
    )
    @merchant_2 = Merchant.create(
      name: 'Once and Floral',
      address: '76 Poinsetta Street',
      city: 'Johnstown',
      state: 'AK',
      zip: 94591
    )
  end

  it "can see all merchant names" do
    visit '/merchants'

    expect(page).to have_content(@merchant_1.name)
    expect(page).to have_content(@merchant_2.name)
  end

  it "can click on merchant name to redirect to merchant show page" do
    visit '/merchants'
    expect(page).to have_link(@merchant_1.name)
    expect(page).to have_link(@merchant_2.name)

    click_link @merchant_1.name
    expect(current_path).to eq("/merchants/#{@merchant_1.id}")

    visit '/merchants'
    click_link @merchant_2.name
    expect(current_path).to eq("/merchants/#{@merchant_2.id}")
  end

  it "can click on items sold to redirect to merchant items index" do
    visit '/merchants'
    expect(page).to have_link('Items Sold')

    first('h6', text: 'Items Sold').click_link 'Items Sold'
    expect(current_path).to eq("/merchants/#{@merchant_1.id}/items")

    visit '/merchants'
    all('h6', text: 'Items Sold')[1].click_link 'Items Sold'
    expect(current_path).to eq("/merchants/#{@merchant_2.id}/items")
  end

end

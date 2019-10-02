require 'rails_helper'

RSpec.describe "merchants show page", type: :feature do

  it "can see name address city state zip" do
    merchant = Merchant.create(
      name: 'Once and Floral',
      address: '76 Poinsetta Street',
      city: 'Johnstown',
      state: 'AK',
      zip: 94591
    )

    visit "/merchants/#{merchant.id}"

    expect(page).to have_content(merchant.name)
    expect(page).to have_content("Address: #{merchant.address}")
    expect(page).to have_content("City: #{merchant.city}")
    expect(page).to have_content("State: #{merchant.state}")
    expect(page).to have_content("Zip Code: #{merchant.zip}")
  end

end

require 'rails_helper'

RSpec.describe "merchants index page", type: :feature do

  it "can see all merchant names" do
    merchant_1 = Merchant.create(
      name: 'Back to the Fuscia',
      address: '1862 W Starlight Road',
      city: 'Frankfurt',
      state: 'KY',
      zip: 23671
    )
    merchant_2 = Merchant.create(
      name: 'Once and Floral',
      address: '76 Poinsetta Street',
      city: 'Johnstown',
      state: 'AK',
      zip: 94591
    )

    visit '/merchants'

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
  end

end

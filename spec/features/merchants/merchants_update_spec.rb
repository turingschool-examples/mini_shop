require 'rails_helper'

describe "merchant update page", type: :feature do
  it "can update a new merchant with a name, address, city, state, zip" do

    merchant = Merchant.create( name: "Chesters Collectables",
                                  address: "123 Fake St",
                                  city: "Awesomeville",
                                  state: "Montana",
                                  zip: 59001,
    )

    visit "/merchants/#{merchant.id}"

    click_link('Edit')
    fill_in('Name', with: 'Chesters Collection')
    fill_in('Address', :with => '456 Real St')
    fill_in('City', with: 'Denverton')
    fill_in('State', with: 'Statestate')
    fill_in('Zip', with: 11111)
    click_on('submit')

    expect(current_path).to eq("/merchants/#{merchant.id}")

    expect(page).to have_content('Chesters Collection')
    expect(page).to have_content('456 Real St')
    expect(page).to have_content('Denverton')
    expect(page).to have_content('Statestate')
    expect(page).to have_content(11111)
  end

end
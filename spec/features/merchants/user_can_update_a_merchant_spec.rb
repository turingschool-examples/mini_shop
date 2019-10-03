require 'rails_helper'

RSpec.describe "on merchant show page", type: :feature do
  it "user can update a merchant's info" do

    merchant_1 = Merchant.create( name: "Corner Store",
                                  address: "234 Yarp Dr.",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80211")
    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_link("Edit Merchant Information",
                              href: "/merchants/#{merchant_1.id}/edit")

    click_link 'Edit Merchant Information'
    expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")

    fill_in :name, with:'A Snore Store'
    fill_in :address, with:'999 yarp dr'
    fill_in :city, with:'Louisville'
    fill_in :state, with:'KY'
    fill_in :zip, with:'40018'
    click_on 'Update Merchant'

    expect(current_path).to eq("/merchants/#{merchant_1.id}")
    expect(page).to have_content('A Snore Store')
    expect(page).to have_content('999 yarp dr')
    expect(page).to have_content('Louisville')
    expect(page).to have_content('KY')
    expect(page).to have_content('40018')
  end
end

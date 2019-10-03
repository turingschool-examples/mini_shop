require 'rails_helper'

RSpec.describe "delete merchant" do
  it "can click delete" do
    merchant_1 = Merchant.create(name: "David's shop",
                                  address: "1234 Broadway St",
                                  city: "Denver",
                                  state: "Colorado",
                                  zip: "80203")

    visit "/merchants/#{merchant_1.id}"

    expect(page).to have_button("Delete")

    click_button "Delete"

    expect(current_path).to eq('/merchants')

    expect(page).to_not have_content(merchant_1.name)
    expect(page).to_not have_content(merchant_1.address)
    expect(page).to_not have_content(merchant_1.city)
    expect(page).to_not have_content(merchant_1.state)
    expect(page).to_not have_content(merchant_1.zip)
  end
end

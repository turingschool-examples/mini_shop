require 'rails_helper'

describe "Delete Merchant" do
  it "Can Delete Merchant from show page" do
    merchant_1 = Merchant.create(name: "Apple",
                              address: "123 Greedy Ave",
                                 city: "Mountain View",
                                state: "CA",
                                  zip: 90001)
    merchant_2 = Merchant.create(name: "Google",
                              address: "456 Greedy Ave",
                                 city: "Mountain View",
                                state: "CA",
                                  zip: 90002)


    visit "/merchants/#{merchant_2.id}"

    expect(page).to have_content(merchant_2.name)

    click_link 'Delete Merchant'

    expect(current_path).to eq('/merchants')
    expect(page).to have_content(merchant_1.name)
    expect(page).to_not have_content(merchant_2.name)

  end
end

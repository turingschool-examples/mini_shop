require 'rails_helper'

RSpec.describe 'As a Visitor' do
  it 'I can delete a merchant' do
    merchant_1 = Merchant.create(name: "She Sells Seashells", address: "1234 Market St", city: "Denver", state: "CO", zipcode: "80220")

    visit "/merchants/#{merchant_1.id}"

    click_link 'Delete Merchant'

    expect(current_path).to eq('/merchants')
    expect(page).to_not have_content(merchant_1.name)
    expect(page).to_not have_button('Delete Merchant')
  end
end

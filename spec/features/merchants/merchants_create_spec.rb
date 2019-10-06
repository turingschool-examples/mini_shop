require 'rails_helper'

describe "merchant create page", type: :feature do
  it "can create a new merchant with a name, address, city, state, zip" do

    visit '/merchants'

    click_link('Create New Merchant')

    expect(current_path).to eql('/merchants/new')
    expect(page).to have_link('Item Index')
    expect(page).to have_link('Merchant Index')

    fill_in('Name', with: 'Chesters Place')
    fill_in('Address', with: '123 fake st')
    fill_in('City', with: 'denver')
    fill_in('State', with: 'co')
    fill_in('Zip', with: 80111)
    click_on('submit')

    expect(current_path).to eql('/merchants')
    expect(page).to have_content('Chesters Place')

    visit "merchants/#{Merchant.last.id}"

    expect(page).to have_content('Chesters Place')
    expect(page).to have_content('123 fake st')
    expect(page).to have_content('denver')
    expect(page).to have_content('co')
    expect(page).to have_content(80111)

  end
end
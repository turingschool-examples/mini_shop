require 'rails_helper'

describe "merchants create", type: :feature do
  it "can create a new merchant" do
    visit '/merchants/new'

    fill_in 'Name', with: 'Pauls Breakfast Shop'
    fill_in 'Address', with: '123 Cheddar Lane'
    fill_in 'City', with: 'Denver'
    fill_in 'State', with: 'CO'
    fill_in 'Zip', with: '80210'

    click_button 'Create'

    expect(current_path).to eq ('/merchants')
    expect(page).to have_content("Pauls Breakfast Shop")
  end
end

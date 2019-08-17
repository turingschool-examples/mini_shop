require "rails_helper"

RSpec.describe "create new merchant" do

  # it 'can create new merchant' do
  #   visit "/merchants"
  #
  #   click_link "New Merchant"
  #
  #   expect(current_path).to eq("/merchants/new")
  #
  #   fill_in :name, with: "The Busy Business"
  #   fill_in :address, with: "0123 West St"
  #   fill_in :city, with: "Chicago"
  #   fill_in :state, with: "IL"
  #   fill_in :zip, with: "60603"
  #
  #   click_on "Submit"
  #
  #   new_merchant = Merchant.last
  #
  #   expect(current_path).to eq("/merchants")
  #   expect(page).to have_content("The Busy Business")
  # end
  #
  # it 'cannot create new merchant without a name' do
  #   visit "/merchants/new"
  #
  #   click_on "Submit"
  #
  #   expect(page).to have_content("Merchant not created: Required information missing.")
  #   expect(page).to have_button("Submit")
  # end

  it 'cannot create new merchant without all merchant info' do
    visit "/merchants/new"

    fill_in :address, with: "0123 West St"
    fill_in :city, with: "Chicago"
    fill_in :zip, with: "60603"

    click_on "Submit"

    expect(page).to have_content("Merchant not created: Required information missing.")
    expect(page).to have_button("Submit")
  end
end

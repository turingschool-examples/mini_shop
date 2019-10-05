# User Story 8, Merchant Items Index
#
# As a visitor
# When I visit '/merchants/:merchant_id/items'
# Then I see each Item that belongs to the Merchant with that merchant_id including the Item's:
# - name
# - price
# - image
# - active/inactive status
# - inventory

require 'rails_helper'

RSpec.describe "merchant items page" do
  it "can see merchant items" do
    merchant_1 = Merchant.create(name: "Zac's shop",
                                  address: "1234 Broadway St",
                                  city: "Denver",
                                  state: "Colorado",
                                  zip: "80203")

    item_1 = merchant_1.items.create!({name: "Pepperoni Pizza",
                                        description: "Fresh pepperoni with all the cheese",
                                        price: 19.99,
                                        image: "https://cdn-image.myrecipes.com/sites/default/files/styles/medium_2x/public/image/recipes/ck/gluten-free-cookbook/pepperoni-pizza-ck-x.jpg?itok=NWreajsZ",
                                        status: "active",
                                        inventory: 10,
                                        merchant_name: "Zac's shop"})

    visit "merchants/#{merchant_1.id}/items"

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_css("img[src*='pepperoni-pizza-ck-x.jpg']")
    expect(page).to have_content(item_1.status)
    expect(page).to have_content(item_1.inventory)
    end
  end

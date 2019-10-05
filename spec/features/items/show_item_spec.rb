#
# As a visitor
# When I visit '/items/:id'
# Then I see the item with that id including the item's:
# - name
# - active/inactive status
# - price
# - description
# - image
# - inventory
# - the name of the merchant that sells the item

require 'rails_helper'

RSpec.describe "item show page" do
  it "can see item by id" do
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


    visit "/items/#{item_1.id}"

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.status)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_1.description)
    expect(page).to have_css("img[src*='pepperoni-pizza-ck-x.jpg']")
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_content(merchant_1.name)
  end
end

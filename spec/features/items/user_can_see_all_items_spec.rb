require 'rails_helper'

RSpec.describe "items index page", type: :feature do
  it "can see all items" do
    merchant_1 = Merchant.create(name: "Zac's shop",
                                  address: "1234 Broadway St",
                                  city: "Denver",
                                  state: "Colorado",
                                  zip: "80203")

    merchant_2 = Merchant.create(name: "Billy's shop",
                                  address: "5789 Lincoln St",
                                  city: "Arvada",
                                  state: "Colorado",
                                  zip: "87342")

    item_1 = merchant_1.items.create!({name: "Pepperoni Pizza",
                                        description: "Fresh pepperoni with all the cheese",
                                        price: 19.99,
                                        image: "https://cdn-image.myrecipes.com/sites/default/files/styles/medium_2x/public/image/recipes/ck/gluten-free-cookbook/pepperoni-pizza-ck-x.jpg?itok=NWreajsZ",
                                        status: "active",
                                        inventory: 10,
                                        merchant_name: "Zac's shop"})

    item_2 = merchant_2.items.create!({name: "Cheese Pizza",
                                        description: "Cheesiest pizza ever!",
                                        price: 17.99,
                                        image: "https://www.averiecooks.com/wp-content/uploads/2018/04/pizza-9.jpg",
                                        status: "active",
                                        inventory: 20,
                                        merchant_name: "Billy's shop"})

    visit "/items"

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_css("img[src*='pepperoni-pizza-ck-x.jpg']")
    expect(page).to have_content(item_1.status)
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_content(merchant_1.name)

    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_2.description)
    expect(page).to have_content(item_2.price)
    expect(page).to have_css("img[src*='pizza-9.jpg']")
    expect(page).to have_content(item_2.status)
    expect(page).to have_content(item_2.inventory)
    expect(page).to have_content(merchant_2.name)
  end
end

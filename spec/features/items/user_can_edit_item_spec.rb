require 'rails_helper'

RSpec.describe "item update", type: :feature do
  it "can click edit" do
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

    expect(page).to have_link("Edit Item")

    click_link "Edit Item"

    expect(current_path).to eq("/items/#{item_1.id}/edit")
  end

  it "can edit item" do
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

    visit "/items/#{item_1.id}/edit"

    fill_in 'Name', with: "New Shop"
    fill_in 'Description', with: "Better pizza"
    fill_in 'Price', with: 17.99
    fill_in 'Image', with: "https://www.averiecooks.com/wp-content/uploads/2018/04/pizza-9.jpg"
    fill_in 'Inventory', with: 100

    click_button 'Submit'

    expect(current_path).to eq("/items/#{item_1.id}")

    expect(page).to have_content("New Shop")
    expect(page).to have_content("Better pizza")
    expect(page).to have_content(17.99)
    expect(page).to have_css("img[src*='pizza-9.jpg']")
    expect(page).to have_content(100)
  end
end

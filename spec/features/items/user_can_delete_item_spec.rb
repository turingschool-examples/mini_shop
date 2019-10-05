#
# As a visitor
# When I visit an item show page
# Then I see a link to delete the item
# When I click the link
# Then a 'DELETE' request is sent to '/items/:id',
# the item is deleted,
# and I am redirected to the item index page where I no longer see this item
require 'rails_helper'

RSpec.describe "item delete", type: :feature do
  it "can delete item" do
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
                                        merchant_name: merchant_1.name})
    visit "/items/#{item_1.id}"

    expect(page).to have_button("Delete")

    click_button "Delete"

    expect(current_path).to eq("/items")

    expect(page).to_not have_content(item_1.name)
    expect(page).to_not have_content(item_1.description)
    expect(page).to_not have_content(item_1.price)
    expect(page).to_not have_css("img[src*='pepperoni-pizza-ck-x.jpg']")
    expect(page).to_not have_content(item_1.inventory)
  end
end

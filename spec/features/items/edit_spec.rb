require "rails_helper"

# As a visitor
# When I visit an Item Show page
# Then I see a link to update that Item
# When I click the link
# I am taken to '/items/:id/edit' where I see a form to edit the item's data including:
# - name
# - price
# - description
# - image
# - inventory
# When I click the button to submit the form
# Then a `PATCH` request is sent to '/items/:id',
# the item's data is updated,
# and I am redirected to the Item Show page where I see the Item's updated information

describe "Item Edit Page" do
  it "has a form to update item information" do
    merchant_1 = Merchant.create!(name: "Football Frenzy", address: "123 14th Circle", city: "Frederick", state: "CO", zip: 80530)
    item_1 = merchant_1.items.create!(name: "Memorabilia Helmet",
              description: "A helmet signed by Joe Montana",
              price: 249,
              image: "https://fanatics.frgimages.com/FFImage/thumb.aspx?i=/productimages/_1576000/ff_1576318_xl.jpg&w=900",
              status: "active",
              inventory: 1)

    visit "/items/#{item_1.id}/edit"

    expect(page).to have_content("Item name:")
    expect(page).to have_content("Item description:")
    expect(page).to have_content("Item price:")
    expect(page).to have_content("Item image link:")
    expect(page).to have_content("Item inventory:")

    fill_in :name, with: "Test update"
    fill_in :description, with: "Test update"
    fill_in :price, with: 234
    fill_in :image, with: "https://ufcw328.org/wp-content/uploads/2016/01/update.jpg"
    fill_in :inventory, with: 567

    click_button "Submit"

    expect(current_path).to eq("/items/#{item_1.id}")

    expect(page).to have_content("Test update")
    expect(page).to have_content("Test update")
    expect(page).to have_content(234)
    expect(page).to have_xpath("//img[@src='https://ufcw328.org/wp-content/uploads/2016/01/update.jpg']")
    expect(page).to have_content("active")
    expect(page).to have_content(567)
  end
end

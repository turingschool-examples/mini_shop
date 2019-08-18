require 'rails_helper'

describe "merchant index/show page" do
  before :each do
    @pug_stuff = Merchant.create(name: "Pug Stuff", address: "3515 Ringsby Court", city: "Denver", state: "CO", zip: 80216)
    @pugtastic = Merchant.create(name: "Pugtastic", address: "3515 Puggy Court", city: "Pugville", state: "CO", zip: 80216)
    @larry_land = Merchant.create(name: "Larry Land", address: "3515 Larrold Court", city: "Derptown", state: "CO", zip: 80216)
  end

  it "name of merchants appear in /merchants" do
     visit "/merchants"

     expect(page).to have_content(@pug_stuff.name)
     expect(page).to have_content(@pugtastic.name)
     expect(page).to have_content(@larry_land.name)
  end

  it "merchant details appear in /merchant/:id" do
    visit "/merchants/#{@pug_stuff.id}"

    expect(page).to have_content(@pug_stuff.name)
    expect(page).to have_content(@pug_stuff.address)
    expect(page).to have_content(@pug_stuff.city)
    expect(page).to have_content(@pug_stuff.state)
    expect(page).to have_content(@pug_stuff.zip)
  end
end

describe "new merchant" do
  it "new merchant in merchant/new" do
    visit "/merchants/new"

    expect(page).to have_button("Submit")

    fill_in :name, with: "Larry"
    fill_in :address, with: "3500 Brighton Blvd"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: 80216
    click_on "Submit"
    new_merchant = Merchant.last

    expect(current_path).to eq("/merchants")
    expect(page).to have_content("Larry")
  end
end

describe "edit merchant" do
  it "should update a merchant" do
    pug_stuff = Merchant.create(name: "Pug Stuff", address: "3515 Ringsby Court", city: "Denver", state: "CO", zip: 80216)

    visit "/merchants/#{pug_stuff.id}"
    click_on "Edit Merchant"
    fill_in :name, with: "Puggy Stuff"
    click_on "Submit"

    expect(current_path).to eq("/merchants")
    expect(page).to have_content("Puggy Stuff")
  end
end

describe "delete merchant" do
  it "deletes merchant" do
    pug_stuff = Merchant.create(name: "Pug Stuff", address: "3515 Ringsby Court", city: "Denver", state: "CO", zip: 80216)
    visit "/merchants/#{pug_stuff.id}/delete"


    expect(current_path).to eq("/merchants")
  end
end

describe "merchant items page" do
  it "shows merchant items" do
    pug_stuff = Merchant.create(name: "Pug Stuff", address: "3515 Ringsby Court", city: "Denver", state: "CO", zip: 80216)
    leopard_leash = pug_stuff.items.create(name: "Leopard Leash", description: "50-inch leash", price: 50, image: "https://images.mattel.com/scene7/GDX05_Leopard_Leash_Set_1?$oslarge$&wid=412&hei=412", inventory: 1)
    pug_food = pug_stuff.items.create(name: "Puggo Food", description: "Dog Food", price: 20, image: "https://www.zooplus.co.uk/magazine/CACHE_IMAGES/768/content/uploads/2018/01/fotolia_108248133.jpg", inventory: 16)

      visit "/merchants/#{pug_stuff.id}/items"

      expect(page).to have_content("Puggo Food")
      expect(page).to have_content("Leopard Leash")

      click_on("Available Items")

      expect(page).to have_content("Puggo Food")
      expect(page).to have_content("Leopard Leash")

      visit "/items/#{leopard_leash.id}"
      click_button("Buy")
      visit "/merchants/#{pug_stuff.id}/items?active=false"

      expect(page).to have_content("Leopard Leash")
  end
end

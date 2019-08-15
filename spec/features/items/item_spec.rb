require 'rails_helper'

describe "item index/show page and edit item" do
  before :each do
    @pug_stuff = Merchant.create(name: "Pug Stuff", address: "3515 Ringsby Court", city: "Denver", state: "CO", zip: 80216)
    @pugtastic = Merchant.create(name: "Pugtastic", address: "3515 Puggy Court", city: "Pugville", state: "CO", zip: 80216)
    @larry_land = Merchant.create(name: "Larry Land", address: "3515 Larrold Court", city: "Derptown", state: "CO", zip: 80216)
    @leopard_leash = @pug_stuff.items.create(name: "Leopard Leash", description: "50-inch leash", price: 50, image: "https://images.mattel.com/scene7/GDX05_Leopard_Leash_Set_1?$oslarge$&wid=412&hei=412", active: true, inventory: 6)
    @pug_food = @pugtastic.items.create(name: "Puggo Food", description: "Dog Food", price: 20, image: "https://www.zooplus.co.uk/magazine/CACHE_IMAGES/768/content/uploads/2018/01/fotolia_108248133.jpg", active: true, inventory: 16)
    @sweet_treats = @larry_land.items.create(name: "Sweet Treats", description: "Dog Treats", price: 6, image: "https://i.pinimg.com/originals/a3/25/17/a32517db583243faca9a5b5742149297.jpg", active: true, inventory: 3)
    @sausages = @larry_land.items.create(name: "Dog Sausage", description: "Dog Sausages", price: 10.50, image: "https://i2.wp.com/deliciouspugshop.com/wp-content/uploads/2017/12/beef-sausage-treats-for-dogs.jpg?fit=425%2C425", active: true, inventory: 13)
  end
  it "items index page" do
    visit "/items"
    expect(page).to have_content("Dog Sausage")
    expect(page).to have_content("Sweet Treats")
  end

  it "item show page" do
    visit "/items/#{@sausages.id}"

    expect(page).to have_content(13)
  end
end

describe "new item" do
  it "adds items" do
    larry_land = Merchant.create(name: "Larry Land", address: "3515 Larrold Court", city: "Derptown", state: "CO", zip: 80216)

    visit "/merchants/#{larry_land.id}/items/new"
    fill_in :name, with: "Dog Toy"
    fill_in :description, with: "a toy for dogs"
    fill_in :price, with: 12
    fill_in :image, with: "dog_toy.jpg"
    fill_in :inventory, with: 10
    click_on "Submit"

    expect(current_path).to eq("/merchants/#{larry_land.id}/items")
    expect(page).to have_content("Dog Toy")
  end
end

describe "edit item" do
  it "edits item" do
    pug_stuff = Merchant.create(name: "Pug Stuff", address: "3515 Ringsby Court", city: "Denver", state: "CO", zip: 80216)
    leopard_leash = pug_stuff.items.create(name: "Leopard Leash", description: "50-inch leash", price: 50, image: "https://images.mattel.com/scene7/GDX05_Leopard_Leash_Set_1?$oslarge$&wid=412&hei=412", active: true, inventory: 6)

    visit "/items/#{leopard_leash.id}"
    click_on "Edit Item"
    fill_in :name, with: "Punk Rock Leash"
    click_on "Submit"

    expect(page).to have_content("Punk Rock Leash")
  end
end

describe "delete item" do
  it "deletes item" do
    pug_stuff = Merchant.create(name: "Pug Stuff", address: "3515 Ringsby Court", city: "Denver", state: "CO", zip: 80216)
    leopard_leash = pug_stuff.items.create(name: "Leopard Leash", description: "50-inch leash", price: 50, image: "https://images.mattel.com/scene7/GDX05_Leopard_Leash_Set_1?$oslarge$&wid=412&hei=412", active: true, inventory: 6)

    visit "/items/#{leopard_leash.id}"
    click_on "Delete Item"

    expect(pug_stuff.items.count).to eq(0)
  end
end

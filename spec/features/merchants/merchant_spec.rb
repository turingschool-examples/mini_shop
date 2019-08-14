require 'rails_helper'

describe "merchant index page" do
  before :each do
    @pug_stuff = Merchant.create(name: "Pug Stuff", address: "3515 Ringsby Court", city: "Denver", state: "CO", zip: 80216)
    @pugtastic = Merchant.create(name: "Pugtastic", address: "3515 Puggy Court", city: "Pugville", state: "CO", zip: 80216)
    @larry_land = Merchant.create(name: "Larry Land", address: "3515 Larrold Court", city: "Derptown", state: "CO", zip: 80216)
  end

  it "name of merchants appear in /merchants" do
     visit "/merchants"
     save_and_open_page
     expect(page).to have_content(@pug_stuff.name)
     expect(page).to have_content(@pugtastic.name)
     expect(page).to have_content(@larry_land.name)
  end

  it "merchant details appear in /merchant/:id" do
    visit "/merchants/#{@pug_stuff.id}"
    save_and_open_page
    expect(page).to have_content(@pug_stuff.name)
    expect(page).to have_content(@pug_stuff.address)
    expect(page).to have_content(@pug_stuff.city)
    expect(page).to have_content(@pug_stuff.state)
    expect(page).to have_content(@pug_stuff.zip)
  end

  it "new merchant in merchant/new" do
    visit "/merchants/new"
    save_and_open_page
    expect(page).to have_button("Submit")
  end
end

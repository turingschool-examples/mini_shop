require "rails_helper"
RSpec.describe "Item delete", type: :feature do
    before(:each) do
    @merchant_1 = Merchant.create!(name: "Megaman Vendor", address: "Address 1", city: "City 1", state: "State 1", zip: "Zip 1")
    @item_1 = Item.create!(name: "Item 1", description: "Description 1", price: 1.00, image: "https://giantbomb1.cbsistatic.com/uploads/scale_small/1/16207/1186400-oss.png", status: true, inventory: 5, merchant: @merchant_1)
  end
    it "deletes item" do

    visit "/items/#{@item_1.id}"
    click_on "Delete Item"
    expect(@merchant_1.items.count).to eq(0)
  end
end

# require 'rails_helper'
#
# describe "As a visitor" do
#   before :each do
#     @merchant_1 = Merchant.create(name: "merchant_1", address: "123 Main", city: "Denver", state:"CO", zip:"80204")
#     @merchant_2 = Merchant.create(name: "merchant_2", address: "789 Pacific", city: "Lakewood", state:"CO", zip:"80214")
#     @item_1 = @merchant_1.items.create(name: "flylow chemical", description: "Mens ski pant", price: 325, image: "how do i do this" , active: true, inventory: 12, merchant_name: "")
#     @item_2 = @merchant_2.items.create(name: "ON3P Jeffrey", description: "Big mountain ski", price: 699, image: "how do i do this" , active: true, inventory: 9, merchant_name: "")
# end
#
#   describe "when I visit '/items'" do
#
#     it "Then I see the name of each merchant in the system" do
#       visit "/items"
#       expect(page).to have_content(@merchant_1.name)
#       expect(page).to have_content(@merchant_2.name)
#       expect(page).to have_content(@item_1.name)
#       expect(page).to have_content(@item_1.description)
#       expect(page).to have_content(@item_1.price)
#       expect(page).to have_content(@item_1.image)
#       expect(page).to have_content(@item_1.active)
#       expect(page).to have_content(@item_1.inventory)
#       expect(page).to have_content(@item_1.merchant_name)
#       expect(page).to have_content(@item_2.name)
#       expect(page).to have_content(@item_2.description)
#       expect(page).to have_content(@item_2.price)
#       expect(page).to have_content(@item_2.image)
#       expect(page).to have_content(@item_2.active)
#       expect(page).to have_content(@item_2.inventory)
#       expect(page).to have_content(@item_2.merchant_name)
#     end
#
#
#     end
# end

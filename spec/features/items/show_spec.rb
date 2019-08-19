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

RSpec.describe 'Item Show page' do
  before :each do
    @pink = Merchant.create(name: 'PINK', address: '3000 E 1st Ave', city: 'Denver', state: 'CO', zip: 80206)
    @hoodie = @pink.items.create(name: 'Hoodie', description: 'Dark Cherry Floral Zip Up Hoodie', price: 40, image: 'https://di2ponv0v5otw.cloudfront.net/posts/2018/05/21/5b02c9373b1608eb868d67bb/m_5b02c9433316271afbef32c2.jpg', status: true, inventory: 11)
    @ulta = Merchant.create(name: 'Ulta', address: '1150 S Ironton', city: 'Aurora', state: 'CO', zip: 80012)
    @chocolate_gold = @ulta.items.create(name: 'Eyeshadow Palette', description: 'Too Faced Chocolate Gold 99 g Eyeshadow Palette', price: 55, image: 'https://rukminim1.flixcart.com/image/704/704/jcqjr0w0/eye-shadow/6/v/y/99-chocolate-gold-too-faced-original-imaffsucfzhtkzzv.jpeg?q=70', status: true, inventory: 20)
  end

  it "show details of an item" do
    visit "/items/#{@chocolate_gold.id}"

    expect(page).to have_content(@chocolate_gold.name)
    expect(page).to have_content(@chocolate_gold.price)
    expect(page).to have_content(@chocolate_gold.description)
    expect(page).to have_content(@chocolate_gold.status)
    expect(page).to have_content(@chocolate_gold.inventory)
    expect(page).to have_content(@ulta.name)
  end

# As a visitor
# When I visit an item show page
# Then I see a link to delete the item
# When I click the link
# Then a 'DELETE' request is sent to '/items/:id',
# the item is deleted,
# and I am redirected to the item index page where I no longer see this item
  it "see delete link that destroys the current item" do
    visit "/items/#{@chocolate_gold.id}"

    click_link 'Delete This Item'

    expect(current_path).to eq('/items')
    expect(page).not_to have_content(@chocolate_gold.name)
    expect(page).to have_content(@hoodie.name)
  end

end

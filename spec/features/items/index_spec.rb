require 'rails_helper'

describe 'Item Index Page' do
  before :each do
    @item_1 = Item.create(name: 'Water Bottle', description: 'Blue - 32oz', price: 15, image: 'image', status: 'Active', inventory: 2, merchant: 'Merchant 1')
    @item_2 = Item.create(name: 'Phone', description: 'Iphone', price: 600, image: 'image', status: 'Active', inventory: 5, merchant: 'Merchant 2')
  end

  it 'user can see all items and their attributes' do
    visit '/items'

    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_1.description)
    expect(page).to have_content(@item_2.price)
    expect(page).to have_content(@item_2.status)
  end
end

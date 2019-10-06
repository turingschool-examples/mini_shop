require 'rails_helper'

describe "Item create page" do
  it "can be a fillable form and lead to item index" do
    merchant_1 = Merchant.create(
      name: 'Costco',
      address: '123 Main st',
      city: 'Lakewood',
      state: 'CO',
      zip: '80127'
    )
    visit "/merchants/#{merchant_1.id}/items"
    click_link 'New Item'
    expect(current_path).to eq("/merchants/#{merchant_1.id}/items/new")
    fill_in 'name', with: 'Goldfish'
    fill_in 'description', with: '24 count of snack goldfish packs'
    fill_in 'price', with: '10.99'
    fill_in 'image', with: 'https://images-na.ssl-images-amazon.com/images/I/51g4wmu9MEL.jpg'
    fill_in 'inventory', with: '730'
    click_button 'Create'
    expect(current_path).to eq("/merchants/#{merchant_1.id}/items")
    expect(Item.last.name).to eq('Goldfish')
    expect(Item.last.description).to eq('24 count of snack goldfish packs')
    expect(Item.last.price).to eq(10.99)
    expect(Item.last.status).to eq('Active')
    expect(Item.last.inventory).to eq(730)
  end
end

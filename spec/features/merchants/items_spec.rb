require 'rails_helper'

describe 'User clicks ITEMS link on merchant show page' do
  it 'Brings user to page with items belonging to that merchant' do
    bob = Merchant.create( name: 'Bob Ross Paints', address: '2345 Happy Tree Place', city: 'Boulder', state: 'CO', zip: '80303')
    brush = bob.items.create( name: 'Bushy Brush',
                      description: 'A lovely bushy brush for brushing bushes.',
                      price: 12.99,
                      image: 'http://www.asianbrushpainter.com/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/h/a/happiness-highland-bull-horn-brush-black-goat-hair-1_27.jpg',
                      active: true,
                      inventory: 32)

    paint = bob.items.create( name: 'Starter Paint Set',
                      description: '24 beautiful natural colors for you to blend and stroke to your hearts content',
                      price: 37.99,
                      image: 'https://cdn.dick-blick.com/items/016/37/01637-0249-5-1-2ww-m.jpg',
                      active: true,
                      inventory: 17)

    visit "merchants/#{bob.id}/items"

    expect(page).to have_content(brush.name)
    expect(page).to have_content(brush.price)
    # expect(page).to have_content(brush.image)
    expect(page).to have_content(brush.status)
    expect(page).to have_content(brush.inventory)

    expect(page).to have_content(paint.name)
    expect(page).to have_content(paint.price)
    # expect(page).to have_content(paint.image)
    expect(page).to have_content(paint.status)
    expect(page).to have_content(paint.inventory)
  end
end

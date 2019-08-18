require 'rails_helper'

describe 'User clicks View Item on items index' do
  it 'Shows the info for that item' do
    bob = Merchant.create( name: 'Bob Ross Paints', address: '2345 Happy Tree Place', city: 'Boulder', state: 'CO', zip: '80303')
    brush = bob.items.create( name: 'Bushy Brush',
                      description: 'A lovely bushy brush for brushing bushes.',
                      price: 12.99,
                      image: 'http://www.asianbrushpainter.com/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/h/a/happiness-highland-bull-horn-brush-black-goat-hair-1_27.jpg',
                      active: true,
                      inventory: 32)

    visit "/items/#{brush.id}"

    expect(page).to have_content(brush.name)
    expect(page).to have_content(brush.description)
    expect(page).to have_content(brush.price)
    expect(page).to have_xpath("//img[@src='http://www.asianbrushpainter.com/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/h/a/happiness-highland-bull-horn-brush-black-goat-hair-1_27.jpg']")
    expect(page).to have_content(brush.status)
    expect(page).to have_content(brush.inventory)
    expect(page).to have_link('Bob Ross Paints')
  end
end

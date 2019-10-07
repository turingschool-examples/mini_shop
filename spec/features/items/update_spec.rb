require 'rails_helper'

RSpec.describe "item update" do

  before :each do
    @merchant = Merchant.create(
      name: 'Back to the Fuschia',
      address: '943 Burberry Drive',
      city: 'Kirksville',
      state: 'NC',
      zip: 30846
    )
    @dahlia = Item.create(
      name: 'Contraste Dahlia Bulbs',
      description: 'A timeless favorite, introduced almost 60 years ago and still going strong. The big blooms measure up to 8 inches across and have striking two-tone petals that are deep burgundy and purple with brilliant white tips.',
      price: 15.40,
      image: 'https://images.pexels.com/photos/599679/pexels-photo-599679.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      active_status: false,
      inventory: 32,
      merchant_id: @merchant.id
    )
  end

  it "can see link to update an item from item show page" do
    visit "items/#{@dahlia.id}"

    expect(page).to have_link('Update Item')
  end

  it "can use link to redirect to edit item page" do
    visit "items/#{@dahlia.id}"
    click_link 'Update Item'

    expect(current_path).to eq("/items/#{@dahlia.id}/edit")
    expect(page).to have_field('item[name]')
    expect(page).to have_field('item[price]')
    expect(page).to have_field('item[description]')
    expect(page).to have_field('item[image]')
    expect(page).to have_field('item[inventory]')
    expect(page).to have_button('Update Item')
  end

  it "can fill out and submit form to update item" do
    visit "/items/#{@dahlia.id}/edit"
    fill_in 'item[name]', with: 'Pink Tropical Hibiscus Tree'
    fill_in 'item[price]', with: 113.83
    fill_in 'item[description]', with: 'Adding a tropical feel to your garden or landscape has never been easier. The pink tropical hibiscus tree is a low-maintenance dwarf tree, reaching only 6-8 feet in height. Its breathtaking blooms occur year-round'
    fill_in 'item[image]', with: 'https://images.pexels.com/photos/244796/pexels-photo-244796.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'
    fill_in 'item[inventory]', with: 17
    click_button 'Update Item'

    expect(current_path).to eq("/items/#{@dahlia.id}")
    expect(page).to have_content('Pink Tropical Hibiscus Tree')
    expect(page).to have_content('Adding a tropical feel to your garden or landscape has never been easier. The pink tropical hibiscus tree is a low-maintenance dwarf tree, reaching only 6-8 feet in height. Its breathtaking blooms occur year-round')
    expect(page).to have_content('$113.83')
    expect(page).to have_css("img[src='https://images.pexels.com/photos/244796/pexels-photo-244796.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260']")
    expect(page).to have_content('Inactive')
    expect(page).to have_content(17)
  end

end

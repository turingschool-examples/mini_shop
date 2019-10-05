require 'rails_helper'

RSpec.describe "merchant items index page", type: :feature do

  before :each do
    @fuschia = Merchant.create(
      name: 'Back to the Fuschia',
      address: '943 Burberry Drive',
      city: 'Kirksville',
      state: 'NC',
      zip: 30846
    )
    @florist = Merchant.create(
      name: 'Florist Gump',
      address: '1523 N Main Street',
      city: 'Plaintree',
      state: 'MN',
      zip: 49155
    )

    @plumeria = Item.create(
      name: 'Plumeria Plant',
      description: 'The PlumeriaTree, also known as the "Scent of Hawaii", is like no other plant. It has electric hues of yellow, pink, and white blossoms that bloom from April until November. It also has a slender, geometric shape, and soft foliage that will branch and produce up to 60 flowers and over 100 blossoms gradually each year.',
      price: 93.20,
      image: 'https://images.pexels.com/photos/63609/plumeria-flower-frangipani-plant-63609.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      active_status: true,
      inventory: 14,
      merchant_id: @fuschia.id
    )
    @dahlia = Item.create(
      name: 'Contraste Dahlia Bulbs',
      description: 'A timeless favorite, introduced almost 60 years ago and still going strong. The big blooms measure up to 8 inches across and have striking two-tone petals that are deep burgundy and purple with brilliant white tips.',
      price: 15.40,
      image: 'https://images.pexels.com/photos/599679/pexels-photo-599679.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      active_status: false,
      inventory: 32,
      merchant_id: @fuschia.id
    )
    @rose = Item.create(
      name: 'Pink Tropical Hibiscus Tree',
      description: 'Adding a tropical feel to your garden or landscape has never been easier. The pink tropical hibiscus tree is a low-maintenance dwarf tree, reaching only 6-8 feet in height. Its breathtaking blooms occur year-round',
      price: 108.65,
      image: 'https://images.pexels.com/photos/244796/pexels-photo-244796.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      active_status: true,
      inventory: 6,
      merchant_id: @florist.id
    )
  end

  it "can see name price image status inventory" do
    visit "/merchants/#{@fuschia.id}/items"

    expect(page).to have_content(@plumeria.name)
    expect(page).to have_content(@plumeria.price)
    expect(page).to have_css("img[src='#{@plumeria.image}']")
    expect(page).to have_content('Active')
    expect(page).to have_content(@plumeria.inventory)

    expect(page).to have_css("#item-#{@plumeria.id}")
    expect(page).to have_css("#item-#{@dahlia.id}")
    expect(page).to_not have_css("#item-#{@rose.id}")
  end

  it "can click on merchant name to redirect to merchant show page" do
    visit "/merchants/#{@florist.id}/items"
    expect(page).to have_link(@rose.merchant.name)

    click_link @rose.merchant.name
    expect(current_path).to eq("/merchants/#{@rose.merchant.id}")
  end

  it "can click on item name to redirect to item show page" do
    visit "/merchants/#{@fuschia.id}/items"
    expect(page).to have_link(@plumeria.name)
    expect(page).to have_link(@dahlia.name)

    click_link @plumeria.name
    expect(current_path).to eq("/items/#{@plumeria.id}")

    visit "/merchants/#{@fuschia.id}/items"
    click_link @dahlia.name
    expect(current_path).to eq("/items/#{@dahlia.id}")
  end

  it "can filter items by active status" do
    visit "/merchants/#{@fuschia.id}/items"

    click_link('All Items')
    expect(page).to have_css("#item-#{@plumeria.id}")
    expect(page).to have_css("#item-#{@dahlia.id}")

    click_link('Active Items')
    expect(page).to have_css("#item-#{@plumeria.id}")
    expect(page).to_not have_css("#item-#{@dahlia.id}")

    click_link('Inactive Items')
    expect(page).to have_css("#item-#{@dahlia.id}")
    expect(page).to_not have_css("#item-#{@plumeria.id}")
  end

end

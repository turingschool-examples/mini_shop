require 'rails_helper'

RSpec.describe "items index page", type: :feature do

  before :each do
    @merchant = Merchant.create(
      name: 'Back to the Fuschia',
      address: '943 Burberry Drive',
      city: 'Kirksville',
      state: 'NC',
      zip: 30846
    )
    @plumeria = Item.create(
      name: 'Plumeria Plant',
      description: 'The PlumeriaTree, also known as the "Scent of Hawaii", is like no other plant. It has electric hues of yellow, pink, and white blossoms that bloom from April until November. It also has a slender, geometric shape, and soft foliage that will branch and produce up to 60 flowers and over 100 blossoms gradually each year.',
      price: 93.20,
      image: 'https://images.pexels.com/photos/63609/plumeria-flower-frangipani-plant-63609.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      active_status: true,
      inventory: 14,
      merchant_id: @merchant.id
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

  it "can see all item parameters" do
    visit '/items'

    expect(page).to have_content(@plumeria.name)
    expect(page).to have_content(@plumeria.description)
    expect(page).to have_content(@plumeria.price)
    expect(page).to have_css("img[src='#{@plumeria.image}']")
    expect(page).to have_content('Active')
    expect(page).to have_content(@plumeria.inventory)
    expect(page).to have_content(@plumeria.merchant.name)

    expect(page).to have_content(@dahlia.name)
    expect(page).to have_content(@dahlia.description)
    expect(page).to have_content(@dahlia.price)
    expect(page).to have_css("img[src='#{@dahlia.image}']")
    expect(page).to have_content('Inactive')
    expect(page).to have_content(@dahlia.inventory)
    expect(page).to have_content(@dahlia.merchant.name)
  end

  it "can click on item name to redirect to item show page" do
    visit '/items'
    expect(page).to have_link(@plumeria.name)
    expect(page).to have_link(@dahlia.name)

    click_link @plumeria.name
    expect(current_path).to eq("/items/#{@plumeria.id}")

    visit '/items'
    click_link @dahlia.name
    expect(current_path).to eq("/items/#{@dahlia.id}")
  end

  it "can click on merchant name to redirect to merchant show page" do
    visit '/items'
    expect(page).to have_link(@dahlia.merchant.name)

    first('p', text: @dahlia.merchant.name).click_link @dahlia.merchant.name
    expect(current_path).to eq("/merchants/#{@dahlia.merchant.id}")
  end

end

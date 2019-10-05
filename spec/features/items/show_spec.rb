require 'rails_helper'

RSpec.describe "item show page", type: :feature do

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
  end

  it "can see all item parameters" do
    visit "items/#{@plumeria.id}"

    expect(page).to have_content(@plumeria.name)
    expect(page).to have_content(@plumeria.description)
    expect(page).to have_content(@plumeria.price)
    expect(page).to have_css("img[src='#{@plumeria.image}']")
    expect(page).to have_content('Active')
    expect(page).to have_content(@plumeria.inventory)
    expect(page).to have_content(@plumeria.merchant.name)
  end

  it "can click on merchant name to redirect to merchant show page" do
    visit '/items'
    expect(page).to have_link(@plumeria.merchant.name)

    click_link @plumeria.merchant.name
    expect(current_path).to eq("/merchants/#{@plumeria.merchant.id}")
  end

  it "can toggle the active status of an item" do
    visit "/items/#{@plumeria.id}"

    expect(page).to_not have_link('Activate')
    click_link 'Deactivate'
    expect(current_path).to eq("/items/#{@plumeria.id}")
    expect(page).to have_css('p.inactive')
    expect(page).to_not have_css('p.active')

    expect(page).to_not have_link('Deactivate')
    click_link 'Activate'
    expect(current_path).to eq("/items/#{@plumeria.id}")
    expect(page).to_not have_css('p.inactive')
    expect(page).to have_css('p.active')
  end

end

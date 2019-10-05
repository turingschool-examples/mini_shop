require 'rails_helper'

RSpec.describe "merchant item creation" do

  before :each do
    @merchant = Merchant.create(
      name: 'Back to the Fuschia',
      address: '943 Burberry Drive',
      city: 'Kirksville',
      state: 'NC',
      zip: 30846
    )
  end

  it "can see link to add new item from merchant items index" do
    visit "/merchants/#{@merchant.id}/items"

    expect(page).to have_link('Create a new item')
  end

  it "can use link to redirect to create item page" do
    visit "/merchants/#{@merchant.id}/items"
    click_link 'Create a new item'

    expect(current_path).to eq("/merchants/#{@merchant.id}/items/new")
    expect(page).to have_field('item[name]')
    expect(page).to have_field('item[price]')
    expect(page).to have_field('item[description]')
    expect(page).to have_field('item[image]')
    expect(page).to have_field('item[inventory]')
    expect(page).to have_button('Create Item')
  end

  it "can fill out and submit form" do
    visit "/merchants/#{@merchant.id}/items/new"
    fill_in 'item[name]', with: 'Pink Tropical Hibiscus Tree'
    fill_in 'item[price]', with: 113.83
    fill_in 'item[description]', with: 'Adding a tropical feel to your garden or landscape has never been easier. The pink tropical hibiscus tree is a low-maintenance dwarf tree, reaching only 6-8 feet in height. Its breathtaking blooms occur year-round'
    fill_in 'item[image]', with: 'https://images.pexels.com/photos/244796/pexels-photo-244796.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'
    fill_in 'item[inventory]', with: 17
    click_button 'Create Item'

    expect(current_path).to eq("/merchants/#{@merchant.id}/items")
    expect(page).to have_content('Pink Tropical Hibiscus Tree')
    expect(page).to have_content(113.83)
    expect(page).to have_css("img[src='https://images.pexels.com/photos/244796/pexels-photo-244796.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260']")
    expect(page).to have_content('Active')
    expect(page).to have_content(17)
  end

  it "can click on merchant name to redirect to merchant show page" do
    visit "/merchants/#{@merchant.id}/items/new"
    expect(page).to have_link(@merchant.name)

    click_link @merchant.name
    expect(current_path).to eq("/merchants/#{@merchant.id}")
  end

end

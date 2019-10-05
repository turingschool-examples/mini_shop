require 'rails_helper'

RSpec.describe "item delete" do

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

  it "can see link to delete item from item show page" do
    visit "/items/#{@dahlia.id}"

    expect(page).to have_link('Delete Item')
  end

  it "can delete item by clicking on the link" do
    visit "items/#{@dahlia.id}"
    click_link 'Delete Item'

    expect(current_path).to eq('/items')
    expect(page).to have_no_content('Contraste Dahlia Bulbs')
    expect(page).to have_no_content('A timeless favorite, introduced almost 60 years ago and still going strong. The big blooms measure up to 8 inches across and have striking two-tone petals that are deep burgundy and purple with brilliant white tips.')
    expect(page).to have_no_content('$15.40')
    expect(page).to have_no_css("img[src='https://images.pexels.com/photos/599679/pexels-photo-599679.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260']")
    expect(page).to have_no_content('Inactive')
    expect(page).to have_no_content(32)
  end

end

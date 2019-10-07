require 'rails_helper'

describe 'Site Navigation' do
  it 'I see a nav bar with a link to all items' do
    visit '/merchants'

    within 'nav' do
      click_link 'All Items'
    end

    expect(current_path).to eq('/items')
  end

  it 'I see a nav bar with a link to all merchants' do
    visit '/items'

    within 'nav' do
      click_link 'All Merchants'
    end

    expect(current_path).to eq('/merchants')
  end
end

require 'rails_helper'

RSpec.describe "Home page" do
  it "should show shop name and image" do
    home_image = "https://image.flaticon.com/icons/svg/862/862856.svg"
    visit '/home'

    expect(page).to have_css("img[src*='#{home_image}']")
    expect(page).to have_link("Mini Shop")
    expect(page).to have_link("Items")
    expect(page).to have_link("Merchants")
  end
end

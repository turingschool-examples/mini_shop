require 'rails_helper'
describe "user visits /merchants" do
  it "can list the name of each merchant" do
    Merchant.create(name: "Santiago")
    visit '/merchants'
    expect(page).to have_content("Santiago")
    expect(page).to have_content("Aimy")
    expect(page).to have_content("Alex")


  end
end

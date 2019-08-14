require "rails_helper"

RSpec.describe "merchants index page", type: :feature do
  it "visitor can see all merchants" do
    merchant_1 = Merchant.create(name: "Cecilia Chapman", address: "711-2880 Nulla St.", city: "Mankato", state: "MS", zip: 96522)
    merchant_2 = Merchant.create(name: "Iris Watson", address: "8562 Fusce Rd.", city: "Frederick", state: "NB", zip: 20620)
    merchant_3 = Merchant.create(name: "Calista Wise", address: "7292 Dictum Ave", city: "San Antonio", state: "MI", zip: 47096)
    merchant_4 = Merchant.create(name: "Forrest Ray", address: "191-103 Integer Rd.", city: "Corona", state: "NM", zip: 47094)
    merchant_5 = Merchant.create(name: "Aaron Hawkins", address: "5587 Nunc. Avenue", city: "Erie", state: "RI", zip: 24975)

    visit "/merchants"

    expect(page).to have_content(merchant_1.name)
    expect(page).to have_content(merchant_2.name)
    expect(page).to have_content(merchant_3.name)
    expect(page).to have_content(merchant_4.name)
    expect(page).to have_content(merchant_5.name)
  end
end

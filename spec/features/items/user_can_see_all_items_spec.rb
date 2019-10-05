require 'rails_helper'

describe "Item index page" do
  it "Can show all items and their attributes" do
    merchant_1 = Merchant.create(name: "Apple",
                              address: "123 Greedy Ave",
                                 city: "Mountain View",
                                state: "CA",
                                  zip: 90001)
    item_1 = Item.create(name: "Pen",
                  description: "Ballpoint ink pen",
                        price: 5,
                        image: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjHy8m84YPlAhUjm-AKHVhoA_IQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.vistaprint.com%2Fmarketing-materials%2Fpens%2Fpremium-ballpoint&psig=AOvVaw0AWcSTG1QUQyoaGTXTktmk&ust=1570318210903655",
                       status: true,
                    inventory: 100,
                    merchant_id: merchant_1.id )
    visit '/items'

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_css("img[src*='https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjHy8m84YPlAhUjm-AKHVhoA_IQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.vistaprint.com%2Fmarketing-materials%2Fpens%2Fpremium-ballpoint&psig=AOvVaw0AWcSTG1QUQyoaGTXTktmk&ust=1570318210903655']")
    expect(page).to have_content("Available")
    expect(page).to have_content(item_1.inventory)
    expect(page).to have_content(merchant_1.name)

  end
end

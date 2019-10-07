require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "I see a delete link on an item's show page" do
    it "Which I can use to delete an item" do

      merchant_1 = Merchant.create(name: "Sam's Sports")
      item_1 = Item.create( name: "Basketball",
                            description: "Regulation size basketball",
                            price: 12.99,
                            image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcT7-MQPSRPxq_qe1X60XAIye4U207uA2-WZq7_frdrGxSnvwiblkg&usqp=CAc.jpg",
                            active: true,
                            inventory:15,
                            merchant_id: merchant_1.id
                          )

      item_2 = Item.create( name: "Baseball",
                            description: "Regulation size baseball",
                            price: 3.99,
                            image: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcT7-MQPSRPxq_qe1X60XAIye4U207uA2-WZq7_frdrGxSnvwiblkg&usqp=CAc.jpg",
                            active: false,
                            inventory:25,
                            merchant_id: merchant_1.id
                          )
      visit "/items/#{item_1.id}"

      click_link 'Delete item'

      expect(current_path).to eq("/items")

      expect(page).to_not have_content(item_1.name)
      expect(page).to_not have_content(item_1.description)
      expect(page).to_not have_content(item_1.price)
      expect(page).to_not have_content(item_1.inventory)

      expect(page).to have_content(item_2.name)
      expect(page).to have_content(item_2.description)
      expect(page).to have_content(item_2.price)
      expect(page).to have_css("img[src*='encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcT7-MQPSRPxq_qe1X60XAIye4U207uA2-WZq7_frdrGxSnvwiblkg&usqp=CAc.jpg']")
      expect(page).to have_content(item_2.inventory)

    end
  end
end

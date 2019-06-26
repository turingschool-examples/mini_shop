# require 'rails_helper'
#
# describe "user creates a new article" do
#   describe "they link from the articles index" do
#     describe "they fill in a title and body" do
#       it "creates a new article" do
#         visit "/merchants"
#         click_link "Create New Merchant"
#
#         expect(current_path).to eq(new_article_path)
#
#         fill_in "article[title]", with: "New Title!"
#         fill_in "article[body]",  with: "New Body!"
#         click_on "Create Article"
#
#         expect(page).to have_content("New Title!")
#         expect(page).to have_content("New Body!")
#       end
#     end
#   end
# end

require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :name => "Name",
      :description => "MyText",
      :price => "9.99",
      :image => "Image",
      :status => false,
      :inventory => 2,
      :merchant => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end

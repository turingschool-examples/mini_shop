require 'rails_helper'

RSpec.describe "merchants/edit", type: :view do
  before(:each) do
    @merchant = assign(:merchant, Merchant.create!(
      :name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString"
    ))
  end

  it "renders the edit merchant form" do
    render

    assert_select "form[action=?][method=?]", merchant_path(@merchant), "post" do

      assert_select "input[name=?]", "merchant[name]"

      assert_select "input[name=?]", "merchant[address]"

      assert_select "input[name=?]", "merchant[city]"

      assert_select "input[name=?]", "merchant[state]"

      assert_select "input[name=?]", "merchant[zip]"
    end
  end
end

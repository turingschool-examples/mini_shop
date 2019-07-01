require 'rails_helper'

RSpec.describe "merchants/new", type: :view do
  before(:each) do
    assign(:merchant, Merchant.new(
      :name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString"
    ))
  end

  it "renders new merchant form" do
    render

    assert_select "form[action=?][method=?]", merchants_path, "post" do

      assert_select "input[name=?]", "merchant[name]"

      assert_select "input[name=?]", "merchant[address]"

      assert_select "input[name=?]", "merchant[city]"

      assert_select "input[name=?]", "merchant[state]"

      assert_select "input[name=?]", "merchant[zip]"
    end
  end
end

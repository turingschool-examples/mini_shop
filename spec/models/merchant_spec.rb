require 'rails_helper'

describe Merchant, type: :model do
  #validations
  describe "validations" do
    it { should validate_presence_of :name}
  end
end

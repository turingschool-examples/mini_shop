require 'rails_helper'

describe Item, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :price }
    it { should validate_presence_of :image }
    it { should validate_presence_of :inventory }
    it { should validate_presence_of :merchant_id }

    it { should validate_inclusion_of(:active_status).in_array([true,false]) }
  end

  describe 'relationships' do
    it { should belong_to :merchant }
  end
end

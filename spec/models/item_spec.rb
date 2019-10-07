require 'rails_helper'

describe Item do
  describe 'Validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :description}
    it { should validate_presence_of :price}
    it { should validate_presence_of :image}
    it { should validate_presence_of :status}
    it { should validate_presence_of :inventory}
  end

  describe 'Relationship' do
    it {should belong_to :merchant}
  end
end

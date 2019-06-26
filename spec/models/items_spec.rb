require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :descripton }
    it { should validate_presence_of :price }
    it { should validate_presence_of :image }
    it { should validate_presence_of :active }
    it { should validate_presence_of :inventory }
  end

  # describe 'relationships' do
  #   it { should belong_to :merchants }
  # end

  # describe 'class methods' do
  #   it '.song_count' do
  #     prince = Artist.create!(name: 'Prince')
  #     talking_heads = Artist.create!(name: 'Talking Heads')
  #     rasperry_beret = prince.songs.create!(title: 'Raspberry Beret', length: 234, play_count: 34)
  #     wild_life = talking_heads.songs.create!(title: 'Wild Wild Life', length: 456, play_count: 45)
  #
  #     expect(Song.song_count).to eq(2)
  #   end
  # end
end

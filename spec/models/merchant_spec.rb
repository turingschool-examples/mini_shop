require 'rails_helper'

describe Merchant, type: :model do

  describe "validations" do
    it { should validate_presence_of :name}
  end

  # describe "relationships" do
  #   it { should have_many :songs}
  # end
  #
  # describe "instance methods" do
  #   it "average play count for artist songs" do
  #     journey = Artist.create(name: "Journey")
  #     song_1 = journey.songs.create(title: "Don't Stop Believin'", length: 303, play_count: 200)
  #     song_2 = journey.songs.create(title: "Wheel In The Sky", length: 253, play_count: 400)
  #
  #     expect(journey.average_play_count).to eq(300)
  #   end
  # end
end

require 'rails_helper'

RSpec.describe Rate do
  describe '#rate' do
    it 'allows to rate from 1 to 5' do
      1.upto(5) do |score|
        expect(Fabricate.build(:rate, score: score)).to be_valid
      end
    end

    it 'doesnt allow negative rates' do
      expect(Fabricate.build(:rate, score: -1)).to_not be_valid
    end

    it 'doesnt allow to give a rate higher than 5' do
      expect(Fabricate.build(:rate, score: 6)).to_not be_valid
    end

    it 'doesnt allow a 0 rate' do
      expect(Fabricate.build(:rate, score: 0)).to_not be_valid
    end
  end

  describe '#text' do
    it 'may omit text' do
      expect(Fabricate.build(:rate, text: nil)).to be_valid
    end

    it 'allows text with 1000 characters' do
      expect(Fabricate.build(:rate, text: Faker::Lorem.characters(number: 1000))).to be_valid
    end

    it "doesn't allow text with more than 1000 characters" do
      expect(Fabricate.build(:rate, text: Faker::Lorem.characters(number: 1001))).to_not be_valid
    end
  end
end

require 'rails_helper'

RSpec.describe Book do
  let!(:book) { Fabricate(:book) }

  describe '#enough_rates?' do
    it 'is true if has 3 rates' do
      Fabricate.times(3, :rate, book: book)
      expect(book.enough_rates?).to be true
    end

    it 'is true if it has 4 rates' do
      Fabricate.times(4, :rate, book: book)
      expect(book.enough_rates?).to be true
    end

    it 'is false if it has 0 rates' do
      expect(book.enough_rates?).to be false
    end

    it 'is false if it has 2 rates' do
      Fabricate.times(2, :rate, book: book)
      expect(book.enough_rates?).to be false
    end
  end

  describe '#average_rate' do
    it 'is 0 if it has 0 rates' do
      expect(book.average_rate).to be 0.0
    end

    it 'returns average rate' do
      Fabricate(:rate, book: book, score: 2)
      Fabricate(:rate, book: book, score: 5)
      Fabricate(:rate, book: book, score: 2)

      expect(book.average_rate).to be 3.0
    end

    it 'returns rounded average rate' do
      Fabricate(:rate, book: book)
      Fabricate(:rate, book: book, score: 5)
      Fabricate(:rate, book: book, score: 2)

      expect(book.average_rate).to be 2.7
    end

    it 'doesnt consider rates from banned users' do
      banned_user = Fabricate(:user, banned: true)
      Fabricate(:rate, book: book, user: banned_user, score: 2)
      Fabricate(:rate, book: book, score: 5)
      Fabricate(:rate, book: book, score: 2)

      expect(book.average_rate).to be 3.5
    end
  end
end

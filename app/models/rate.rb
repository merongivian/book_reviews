class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :score, numericality: { in: 1..5 }
  validates :text, length: { maximum: 1000 }
end

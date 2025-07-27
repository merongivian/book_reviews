class Book < ApplicationRecord
  has_many :rates

  def enough_rates?
    rates.count >= 3
  end

  def average_rate
    rates.joins(:user).where(user: { banned: false }).average(:score).to_f.round(1)
  end
end

class AddScoreToRates < ActiveRecord::Migration[8.0]
  def change
    add_column :rates, :score, :integer, null: false, default: 0
  end
end

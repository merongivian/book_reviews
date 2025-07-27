class CreateRates < ActiveRecord::Migration[8.0]
  def change
    create_table :rates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.string :text, null: false

      t.timestamps
    end

    add_index :rates, [:user_id, :book_id], unique: true
  end
end

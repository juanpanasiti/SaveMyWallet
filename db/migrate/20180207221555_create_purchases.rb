class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.string :item_name
      t.belongs_to :user, foreign_key: true
      t.belongs_to :credit_card, foreign_key: true
      t.decimal :amount
      t.integer :fees

      t.timestamps
    end
  end
end

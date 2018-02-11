class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.belongs_to :purchase, foreign_key: true
      t.integer :fee
      t.decimal :amount

      t.timestamps
    end
  end
end

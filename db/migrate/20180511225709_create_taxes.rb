class CreateTaxes < ActiveRecord::Migration[5.1]
  def change
    create_table :taxes do |t|
      t.string :name
      t.decimal :amount
      t.date :exp_date
      t.text :note
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

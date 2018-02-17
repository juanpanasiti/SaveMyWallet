class AddFirstPaymentToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :first_payment, :date
  end
end

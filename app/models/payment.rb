class Payment < ApplicationRecord
  belongs_to :purchase
  before_create :set_status
  #### CALLBACKS
  def set_status
    self.status = 'Para pagar'
  end
  #### OBJECT METHODS
  def month_to_pay
    month = self.purchase.first_payment.advance(months: (self.fee - 1)).end_of_month
    # Purchase.first.first_payment.advance(months: Purchase.last.fees).month
    return month.strftime("%b%y")
  end
  #### CLASS METHODS
  def self.add_payments(purchase)
    amount_per_fee = purchase.amount / purchase.fees
    ok = true
    for fee in 1..purchase.fees
      new_payment = Payment.new
      new_payment.purchase_id = purchase.id
      new_payment.amount = amount_per_fee.round(2)
      new_payment.fee = fee
      unless new_payment.save
        ok = false
      end
    end #for
    return ok
  end #add_payments
end

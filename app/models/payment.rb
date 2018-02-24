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
    return month
  end # month_to_pay

  def pay
    self.status = "Pagado"
    if self.save
      return true
    else
      return false
    end
  end #pay
  def unpay
    self.status = "Para pagar"
    if self.save
      return true
    else
      return false
    end
  end #pay

  def last_fee?
    is_the_last = false
    if self.fee == self.purchase.fees
      is_the_last = true
    end
    return is_the_last
  end #last_fee?

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

  def self.months_resume
    payments = Payment.all

    return [['Feb18',5000],['Mar18',4500],['Abr18',4000],['May18',4000]]
  end
end

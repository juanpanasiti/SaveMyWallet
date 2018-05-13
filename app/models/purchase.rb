class Purchase < ApplicationRecord
  belongs_to :credit_card
  belongs_to :user
  has_many :payments

  before_destroy :delete_payments

  def delete_payments
    self.payments.each do |payment|
      payment.delete
    end
    return true
  end

  def credit_card_name
    cc = self.credit_card
    name = "#{cc.issuer} #{cc.kind}"
    return name
  end

  def has_payments?
    payments = Payment.where(purchase_id: self.id).count

    if payments > 0
      return true
    else
      return false
    end
  end #End_has_payments?

  #### CLASS METHODS
  def self.months_resume(user)
    purchases = user.purchases.all.order(first_payment: :asc)
    resume = [] # [["Feb18",5000]]
    purchases.each do |purchase|
      for i in 0..(purchase.fees - 1)
        if purchase.payments.count > 0
          to_pay = purchase.payments.where(fee: i+1).first
          if to_pay.status == "Para pagar"
            fee_amount = to_pay.amount
          else
            fee_amount = 0
          end
        else
          fee_amount = (purchase.amount / purchase.fees).round(2)
        end

        payment_date = purchase.first_payment.advance(months: (i))
        added = false
        resume.each do |m|
          if m[0].to_s == payment_date.to_s
            m[1] = m[1] + fee_amount
            added = true
            break
          end #if
        end #each_do m
        unless added
          if fee_amount > 0
            resume << [payment_date, fee_amount]
          end
        end #unless added
      end #for
    end #each_do purchase
    #resume = [['Feb18',5000],['Mar18',4500],['Abr18',4000],['May18',4000]]
    return resume
  end #months_resume

  #### SCOPES
  scope :no_charged, ->{
    includes(:payments).where(payments: { id: nil })
  }
end

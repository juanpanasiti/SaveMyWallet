class Purchase < ApplicationRecord
  belongs_to :credit_card
  has_many :payments

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
  #### SCOPES
  scope :no_charged, ->{
    includes(:payments).where(payments: { id: nil })
  }
end

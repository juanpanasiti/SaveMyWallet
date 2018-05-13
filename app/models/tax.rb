class Tax < ApplicationRecord
  #### ASSOSSIATIONS
  belongs_to :user
  #### VALIDATIONS
  validates_presence_of :name, :message => "no puede estar en blanco."
  #### METHODS
  #### CLASS METHODS
  def self.get_status_options
    options = ['Esperando factura','Para pagar','Pagado','Vencido']
    return options
  end

  def self.by_month(user, month)
    first_day = Date.parse(month).beginning_of_month
    last_day = Date.parse(month).end_of_month
    range = first_day..last_day
    taxes = user.taxes.where('exp_date BETWEEN ? AND ?', first_day, last_day)

    return taxes
  end
end

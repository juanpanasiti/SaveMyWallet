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
end
